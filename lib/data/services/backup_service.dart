import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

import '../../core/constants/app_constants.dart';
import '../../core/utils/date_utils.dart';
import '../database/app_database.dart';
import '../models/backup_metadata.dart';

/// Handles CashBook-compatible ZIP backup import and export.
class BackupService {
  BackupService(this._database);

  final AppDatabase _database;

  Stream<BackupProgress> exportBackup() async* {
    yield const BackupProgress(
      stage: BackupProgressStage.validating,
      progress: 0.1,
      message: 'Preparing backup...',
    );

    try {
      final docsDir = await AppDatabase.getDocumentsDirectory();
      final timestamp = CashBookDateUtils.formatBackupFileName(DateTime.now());
      final backupDir = Directory(p.join(docsDir, 'backups'));
      if (!await backupDir.exists()) {
        await backupDir.create(recursive: true);
      }

      final zipPath = p.join(
        backupDir.path,
        '${AppConstants.backupPrefix}$timestamp.zip',
      );

      yield const BackupProgress(
        stage: BackupProgressStage.extracting,
        progress: 0.3,
        message: 'Collecting database files...',
      );

      await _database.close();

      final archive = Archive();
      final cashbookPath = p.join(docsDir, AppConstants.cashbookDbName);
      final notebookPath = p.join(docsDir, AppConstants.notebookDbName);

      if (await File(cashbookPath).exists()) {
        archive.addFile(
          ArchiveFile(
            AppConstants.cashbookDbName,
            await File(cashbookPath).length(),
            await File(cashbookPath).readAsBytes(),
          ),
        );
      }

      if (await File(notebookPath).exists()) {
        archive.addFile(
          ArchiveFile(
            AppConstants.notebookDbName,
            await File(notebookPath).length(),
            await File(notebookPath).readAsBytes(),
          ),
        );
      } else {
        archive.addFile(
          ArchiveFile(AppConstants.notebookDbName, 0, <int>[]),
        );
      }

      final walPath = p.join(docsDir, AppConstants.notebookWalName);
      final shmPath = p.join(docsDir, AppConstants.notebookShmName);
      if (await File(walPath).exists()) {
        archive.addFile(
          ArchiveFile(
            AppConstants.notebookWalName,
            await File(walPath).length(),
            await File(walPath).readAsBytes(),
          ),
        );
      }
      if (await File(shmPath).exists()) {
        archive.addFile(
          ArchiveFile(
            AppConstants.notebookShmName,
            await File(shmPath).length(),
            await File(shmPath).readAsBytes(),
          ),
        );
      }

      final metadata = BackupMetadata.create();
      final metadataBytes = utf8.encode(jsonEncode(metadata.toJson()));
      archive.addFile(
        ArchiveFile(
          AppConstants.metadataFileName,
          metadataBytes.length,
          metadataBytes,
        ),
      );

      yield const BackupProgress(
        stage: BackupProgressStage.importing,
        progress: 0.7,
        message: 'Creating ZIP archive...',
      );

      final encoder = ZipEncoder();
      final zipData = encoder.encode(archive);
      await File(zipPath).writeAsBytes(zipData);

      yield BackupProgress(
        stage: BackupProgressStage.complete,
        progress: 1.0,
        message: zipPath,
      );
    } catch (e) {
      yield BackupProgress(
        stage: BackupProgressStage.error,
        progress: 0,
        message: e.toString(),
      );
      rethrow;
    }
  }

  Stream<BackupProgress> importBackup(
    String zipFilePath, {
    BackupImportMode mode = BackupImportMode.replace,
  }) async* {
    yield const BackupProgress(
      stage: BackupProgressStage.validating,
      progress: 0.1,
      message: 'Validating ZIP file...',
    );

    try {
      final zipFile = File(zipFilePath);
      if (!await zipFile.exists()) {
        throw Exception('Backup file not found');
      }

      final bytes = await zipFile.readAsBytes();
      final archive = ZipDecoder().decodeBytes(bytes);
      if (archive.isEmpty) {
        throw Exception('Invalid or empty ZIP archive');
      }

      final fileNames = archive.files.map((f) => f.name).toSet();
      for (final required in AppConstants.requiredBackupFiles) {
        final hasFile = fileNames.any(
          (name) => p.basename(name) == required,
        );
        if (!hasFile) {
          throw Exception('Missing required file: $required');
        }
      }

      yield const BackupProgress(
        stage: BackupProgressStage.validating,
        progress: 0.2,
        message: 'Validating metadata...',
      );

      final metadataFile = archive.files.firstWhere(
        (f) => p.basename(f.name) == AppConstants.metadataFileName,
      );
      final metadataJson =
          jsonDecode(utf8.decode(metadataFile.content)) as Map<String, dynamic>;
      final metadata = BackupMetadata.fromJson(metadataJson);

      if (metadata.version > AppConstants.backupVersion) {
        throw Exception(
          'Unsupported backup version: ${metadata.version}',
        );
      }

      yield const BackupProgress(
        stage: BackupProgressStage.extracting,
        progress: 0.4,
        message: 'Extracting files...',
      );

      final docsDir = await AppDatabase.getDocumentsDirectory();
      final tempDir = Directory(p.join(docsDir, 'backup_temp'));
      if (await tempDir.exists()) {
        await tempDir.delete(recursive: true);
      }
      await tempDir.create(recursive: true);

      for (final file in archive.files) {
        if (file.isFile) {
          final outPath = p.join(tempDir.path, p.basename(file.name));
          await File(outPath).writeAsBytes(file.content as List<int>);
        }
      }

      yield BackupProgress(
        stage: mode == BackupImportMode.replace
            ? BackupProgressStage.importing
            : BackupProgressStage.merging,
        progress: 0.6,
        message: mode == BackupImportMode.replace
            ? 'Replacing database...'
            : 'Merging data...',
      );

      await _database.close();

      final cashbookSrc = p.join(tempDir.path, AppConstants.cashbookDbName);
      final cashbookDest = p.join(docsDir, AppConstants.cashbookDbName);

      if (mode == BackupImportMode.replace) {
        await File(cashbookDest).writeAsBytes(
          await File(cashbookSrc).readAsBytes(),
          flush: true,
        );
        await _removeSidecarFiles(cashbookDest);
      } else {
        await _mergeDatabase(cashbookSrc, cashbookDest);
      }

      await _deduplicateCategoriesAndPayModes(cashbookDest);

      final notebookSrc = p.join(tempDir.path, AppConstants.notebookDbName);
      final notebookDest = p.join(docsDir, AppConstants.notebookDbName);
      if (await File(notebookSrc).exists()) {
        final notebookBytes = await File(notebookSrc).readAsBytes();
        if (notebookBytes.isNotEmpty) {
          await File(notebookDest).writeAsBytes(notebookBytes, flush: true);
        }
      }

      for (final walShm in [
        AppConstants.notebookWalName,
        AppConstants.notebookShmName,
      ]) {
        final src = p.join(tempDir.path, walShm);
        final dest = p.join(docsDir, walShm);
        if (await File(src).exists()) {
          await File(dest).writeAsBytes(
            await File(src).readAsBytes(),
            flush: true,
          );
        }
      }

      await tempDir.delete(recursive: true);

      yield const BackupProgress(
        stage: BackupProgressStage.complete,
        progress: 1.0,
        message: 'Import completed successfully',
      );
    } catch (e) {
      yield BackupProgress(
        stage: BackupProgressStage.error,
        progress: 0,
        message: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> _removeSidecarFiles(String dbPath) async {
    for (final suffix in ['-wal', '-shm', '-journal']) {
      final sidecar = File('$dbPath$suffix');
      if (await sidecar.exists()) {
        await sidecar.delete();
      }
    }
  }

  Future<void> _mergeDatabase(String sourcePath, String destPath) async {
    final sourceDb = AppDatabase(
      NativeDatabase(File(sourcePath), logStatements: false),
    );

    try {
      final sourceAccounts = await sourceDb.select(sourceDb.accountEntries).get();
      final sourceTransactions =
          await sourceDb.select(sourceDb.incomeTable).get();
      final sourceCategories = await sourceDb.select(sourceDb.categoryTable).get();
      final sourcePayModes = await sourceDb.select(sourceDb.payModeTable).get();
      final sourceReminders = await sourceDb.select(sourceDb.reminders).get();

      final destDb = AppDatabase(
        NativeDatabase(File(destPath), logStatements: false),
      );

      try {
        final destCategories = await destDb.select(destDb.categoryTable).get();
        final existingCategoryNames = destCategories
            .map((c) => c.categoryName.trim().toLowerCase())
            .toSet();
        final destPayModes = await destDb.select(destDb.payModeTable).get();
        final existingPayModeNames = destPayModes
            .map((m) => m.payModeName.trim().toLowerCase())
            .toSet();

        for (final account in sourceAccounts) {
          await destDb.into(destDb.accountEntries).insert(
                AccountEntriesCompanion.insert(
                  entryName: account.entryName,
                  entryDateTime: account.entryDateTime,
                ),
                mode: InsertMode.insertOrIgnore,
              );
        }

        for (final cat in sourceCategories) {
          final nameKey = cat.categoryName.trim().toLowerCase();
          if (existingCategoryNames.contains(nameKey)) continue;
          await destDb.into(destDb.categoryTable).insert(
                CategoryTableCompanion.insert(categoryName: cat.categoryName),
              );
          existingCategoryNames.add(nameKey);
        }

        for (final mode in sourcePayModes) {
          final nameKey = mode.payModeName.trim().toLowerCase();
          if (existingPayModeNames.contains(nameKey)) continue;
          await destDb.into(destDb.payModeTable).insert(
                PayModeTableCompanion.insert(payModeName: mode.payModeName),
              );
          existingPayModeNames.add(nameKey);
        }

        for (final reminder in sourceReminders) {
          await destDb.into(destDb.reminders).insert(
                RemindersCompanion.insert(
                  id: reminder.id,
                  name: reminder.name,
                  frequency: reminder.frequency,
                  date: reminder.date,
                  time: reminder.time,
                  note: reminder.note,
                  isActive: reminder.isActive,
                ),
                mode: InsertMode.insertOrReplace,
              );
        }

        for (final tx in sourceTransactions) {
          await destDb.into(destDb.incomeTable).insert(
                IncomeTableCompanion.insert(
                  accountId: tx.accountId,
                  categoryId: tx.categoryId,
                  date: tx.date,
                  time: tx.time,
                  amount: tx.amount,
                  name: tx.name,
                  category: tx.category,
                  remark: tx.remark,
                  paymentMode: tx.paymentMode,
                  lastEditedDate: tx.lastEditedDate,
                  lastEditedTime: tx.lastEditedTime,
                  imageUris: tx.imageUris,
                  type: tx.type,
                  isHeader: tx.isHeader,
                  isBookmarked: Value(tx.isBookmarked),
                  fromAccount: Value(tx.fromAccount),
                  toAccount: Value(tx.toAccount),
                  transferType: Value(tx.transferType),
                ),
              );
        }
      } finally {
        await destDb.close();
      }
    } finally {
      await sourceDb.close();
    }
  }

  Future<void> _deduplicateCategoriesAndPayModes(String dbPath) async {
    final db = AppDatabase(
      NativeDatabase(File(dbPath), logStatements: false),
    );

    try {
      final categories = await db.select(db.categoryTable).get();
      categories.sort((a, b) => a.id.compareTo(b.id));
      final keptCategoryNames = <String, int>{};

      for (final cat in categories) {
        final nameKey = cat.categoryName.trim().toLowerCase();
        final keptId = keptCategoryNames[nameKey];
        if (keptId != null) {
          await (db.update(db.incomeTable)
                ..where((t) => t.categoryId.equals(cat.id)))
              .write(IncomeTableCompanion(categoryId: Value(keptId)));
          await (db.delete(db.categoryTable)
                ..where((t) => t.id.equals(cat.id)))
              .go();
        } else {
          keptCategoryNames[nameKey] = cat.id;
        }
      }

      final payModes = await db.select(db.payModeTable).get();
      payModes.sort((a, b) => a.id.compareTo(b.id));
      final keptPayModeNames = <String>{};

      for (final mode in payModes) {
        final nameKey = mode.payModeName.trim().toLowerCase();
        if (keptPayModeNames.contains(nameKey)) {
          await (db.delete(db.payModeTable)
                ..where((t) => t.id.equals(mode.id)))
              .go();
        } else {
          keptPayModeNames.add(nameKey);
        }
      }
    } finally {
      await db.close();
    }
  }

  Future<BackupMetadata> validateBackup(String zipFilePath) async {
    final bytes = await File(zipFilePath).readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);
    final metadataFile = archive.files.firstWhere(
      (f) => p.basename(f.name) == AppConstants.metadataFileName,
      orElse: () => throw Exception('metadata.json not found'),
    );
    final json =
        jsonDecode(utf8.decode(metadataFile.content)) as Map<String, dynamic>;
    return BackupMetadata.fromJson(json);
  }
}
