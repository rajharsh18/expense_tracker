import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:path/path.dart' as p;

import 'package:expense_tracker/core/constants/app_constants.dart';
import 'package:expense_tracker/data/database/app_database.dart';
import 'package:expense_tracker/data/models/backup_metadata.dart';
import 'package:expense_tracker/data/services/backup_service.dart';

void main() {
  late Directory tempDir;
  late AppDatabase database;
  late BackupService backupService;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('backup_test');
    database = AppDatabase.forTesting(NativeDatabase.memory());
    backupService = BackupService(database);

    await database
        .into(database.accountEntries)
        .insert(
          AccountEntriesCompanion.insert(
            entryName: 'Test',
            entryDateTime: '10 Nov 2025 05:15 AM',
          ),
        );
  });

  tearDown(() async {
    await database.close();
    if (await tempDir.exists()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('BackupMetadata serializes correctly', () {
    final metadata = BackupMetadata.create();
    final json = metadata.toJson();

    expect(json['app_name'], 'CashBook');
    expect(json['version'], 1);
    expect(json['attachment_count'], 0);
    expect(json['backup_date'], isNotEmpty);

    final restored = BackupMetadata.fromJson(json);
    expect(restored.appName, 'CashBook');
  });

  test('validates backup ZIP structure', () async {
    final archive = Archive();
    archive.addFile(ArchiveFile(AppConstants.cashbookDbName, 0, <int>[]));
    archive.addFile(ArchiveFile(AppConstants.notebookDbName, 0, <int>[]));

    final metadata = BackupMetadata.create();
    final metadataBytes = utf8.encode(jsonEncode(metadata.toJson()));
    archive.addFile(
      ArchiveFile(
        AppConstants.metadataFileName,
        metadataBytes.length,
        metadataBytes,
      ),
    );

    final zipPath = p.join(tempDir.path, 'test_backup.zip');
    final zipData = ZipEncoder().encode(archive);
    await File(zipPath).writeAsBytes(zipData);

    final validated = await backupService.validateBackup(zipPath);
    expect(validated.appName, 'CashBook');
    expect(validated.version, 1);
  });

  test('import replace opens CashBook v3 database without migration error',
      () async {
    final sampleDb = File('sample_db/cashbook_db.db');
    if (!await sampleDb.exists()) {
      return; // sample_db is optional (gitignored)
    }

    final destDbPath = p.join(tempDir.path, 'cashbook_db.db');
    await File(destDbPath).writeAsBytes(await sampleDb.readAsBytes());

    await database.close();
    final imported = AppDatabase(
      NativeDatabase(File(destDbPath), logStatements: false),
    );
    try {
      final transactions = await imported.select(imported.incomeTable).get();
      expect(transactions, isNotEmpty);
    } finally {
      await imported.close();
    }
  });

  test('rejects backup without metadata', () async {
    final archive = Archive();
    archive.addFile(ArchiveFile(AppConstants.cashbookDbName, 0, <int>[]));

    final zipPath = p.join(tempDir.path, 'invalid_backup.zip');
    await File(zipPath).writeAsBytes(ZipEncoder().encode(archive));

    expect(() => backupService.validateBackup(zipPath), throwsException);
  });
}
