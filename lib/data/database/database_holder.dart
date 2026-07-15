import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';

/// Holds a singleton database connection with reopen support after backup.
class DatabaseHolder {
  AppDatabase? _database;

  AppDatabase get database {
    if (_database == null) {
      throw StateError('Database not initialized. Call open() first.');
    }
    return _database!;
  }

  Future<AppDatabase> open() async {
    _database ??= await AppDatabase.open();
    return _database!;
  }

  Future<AppDatabase> reopen() async {
    await _database?.close();
    _database = await AppDatabase.open();
    return _database!;
  }

  Future<void> close() async {
    await _database?.close();
    _database = null;
  }
}

final databaseHolderProvider = Provider<DatabaseHolder>((ref) {
  return DatabaseHolder();
});

final databaseRefreshProvider = StateProvider<int>((ref) => 0);

final databaseProvider = Provider<AppDatabase>((ref) {
  ref.watch(databaseRefreshProvider);
  return ref.watch(databaseHolderProvider).database;
});
