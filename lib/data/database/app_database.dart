import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../core/constants/app_constants.dart';
import 'tables/cashbook_tables.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    CategoryTable,
    PayModeTable,
    CurrencyDenominations,
    Category,
    SubCategories,
    AccountEntries,
    Reminders,
    IncomeTable,
    RoomMasterTable,
    AndroidMetadata,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => AppConstants.cashbookSchemaVersion;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await _seedDefaults();
    },
    onUpgrade: (m, from, to) async {
      // CashBook backups use Room schema version 3. Imported databases may
      // report versions 1–3; this app always created the full v3 layout in
      // onCreate, so upgrades only need to bump PRAGMA user_version.
      if (from < 2) {
        await _upgradeToV2(m);
      }
      if (from < 3) {
        await _upgradeToV3(m);
      }
    },
    beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );

  Future<void> _upgradeToV2(Migrator m) async {
    await _addColumnIfMissing(
      m,
      incomeTable,
      incomeTable.isBookmarked,
    );
  }

  Future<void> _upgradeToV3(Migrator m) async {
    await _addColumnIfMissing(m, incomeTable, incomeTable.fromAccount);
    await _addColumnIfMissing(m, incomeTable, incomeTable.toAccount);
    await _addColumnIfMissing(m, incomeTable, incomeTable.transferType);
  }

  Future<void> _addColumnIfMissing(
    Migrator m,
    TableInfo table,
    GeneratedColumn column,
  ) async {
    final rows = await customSelect(
      'PRAGMA table_info(${table.actualTableName})',
    ).get();
    final exists = rows.any(
      (row) => row.read<String>('name') == column.name,
    );
    if (!exists) {
      await m.addColumn(table, column);
    }
  }

  Future<void> _seedDefaults() async {
    await into(roomMasterTable).insert(
      RoomMasterTableCompanion.insert(
        id: const Value(42),
        identityHash: AppConstants.roomIdentityHash,
      ),
      mode: InsertMode.insertOrIgnore,
    );
    await into(androidMetadata).insert(
      AndroidMetadataCompanion.insert(locale: 'en_US'),
      mode: InsertMode.insertOrIgnore,
    );

    final existingCategories = await (select(categoryTable)).get();
    if (existingCategories.isEmpty) {
      const defaults = [
        'No Category',
        'Food',
        'Groceries',
        'Salary',
        'EMI',
        'Shopping',
        'Transport',
        'Entertainment',
        'Health',
        'Electronics',
        'Rent',
        'Utilities',
        'Investment',
        'Transfer',
      ];
      for (final name in defaults) {
        await into(
          categoryTable,
        ).insert(CategoryTableCompanion.insert(categoryName: name));
      }
    }

    final existingPayModes = await (select(payModeTable)).get();
    if (existingPayModes.isEmpty) {
      for (final name in ['Cash', 'Online', 'UPI', 'Card', 'Bank Transfer']) {
        await into(
          payModeTable,
        ).insert(PayModeTableCompanion.insert(payModeName: name));
      }
    }

    final existingFilterCategories = await (select(category)).get();
    if (existingFilterCategories.isEmpty) {
      const filterCats = [
        'Date',
        'Finance',
        'Payment Mode',
        'Name',
        'Category',
        'Attachment',
      ];
      for (final name in filterCats) {
        await into(category).insert(CategoryCompanion.insert(name: name));
      }
    }
  }

  static Future<AppDatabase> open() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dir.path, AppConstants.cashbookDbName);
    return AppDatabase(NativeDatabase.createInBackground(File(dbPath)));
  }

  static Future<String> getDatabasePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return p.join(dir.path, AppConstants.cashbookDbName);
  }

  static Future<String> getNotebookDatabasePath() async {
    final dir = await getApplicationDocumentsDirectory();
    return p.join(dir.path, AppConstants.notebookDbName);
  }

  static Future<String> getDocumentsDirectory() async {
    final dir = await getApplicationDocumentsDirectory();
    return dir.path;
  }
}
