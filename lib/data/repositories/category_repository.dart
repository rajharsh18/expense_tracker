import 'package:drift/drift.dart';

import '../../domain/entities/transaction_entity.dart';
import '../database/app_database.dart';

/// Repository for category management.
class CategoryRepository {
  CategoryRepository(this._db);

  final AppDatabase _db;

  Stream<List<CategoryEntity>> watchAll() {
    return (_db.select(_db.categoryTable)
          ..orderBy([
            (c) => OrderingTerm(expression: c.id, mode: OrderingMode.asc),
          ]))
        .watch()
        .map(
          (rows) => rows
              .map(
                (r) => CategoryEntity(id: r.id, categoryName: r.categoryName),
              )
              .toList(),
        );
  }

  Future<List<CategoryEntity>> getAll() async {
    final rows = await _db.select(_db.categoryTable).get();
    return rows
        .map((r) => CategoryEntity(id: r.id, categoryName: r.categoryName))
        .toList();
  }

  Future<int> insert(String name) {
    return _db.into(_db.categoryTable).insert(
          CategoryTableCompanion.insert(categoryName: name),
        );
  }

  Future<int> update(int id, String name) {
    return (_db.update(_db.categoryTable)..where((c) => c.id.equals(id)))
        .write(CategoryTableCompanion(categoryName: Value(name)));
  }

  Future<int> delete(int id) {
    return (_db.delete(_db.categoryTable)..where((c) => c.id.equals(id))).go();
  }
}

/// Repository for payment mode management.
class PaymentModeRepository {
  PaymentModeRepository(this._db);

  final AppDatabase _db;

  Stream<List<PayModeEntity>> watchAll() {
    return (_db.select(_db.payModeTable)
          ..orderBy([
            (p) => OrderingTerm(expression: p.id, mode: OrderingMode.asc),
          ]))
        .watch()
        .map(
          (rows) => rows
              .map(
                (r) => PayModeEntity(id: r.id, payModeName: r.payModeName),
              )
              .toList(),
        );
  }

  Future<List<PayModeEntity>> getAll() async {
    final rows = await _db.select(_db.payModeTable).get();
    return rows
        .map((r) => PayModeEntity(id: r.id, payModeName: r.payModeName))
        .toList();
  }

  Future<int> insert(String name) {
    return _db.into(_db.payModeTable).insert(
          PayModeTableCompanion.insert(payModeName: name),
        );
  }

  Future<int> update(int id, String name) {
    return (_db.update(_db.payModeTable)..where((p) => p.id.equals(id)))
        .write(PayModeTableCompanion(payModeName: Value(name)));
  }

  Future<int> delete(int id) {
    return (_db.delete(_db.payModeTable)..where((p) => p.id.equals(id))).go();
  }
}

/// Repository for reminder management.
class ReminderRepository {
  ReminderRepository(this._db);

  final AppDatabase _db;

  Stream<List<ReminderEntity>> watchActive() {
    return (_db.select(_db.reminders)
          ..where((r) => r.isActive.equals(1))
          ..orderBy([
            (r) => OrderingTerm(expression: r.date, mode: OrderingMode.asc),
          ]))
        .watch()
        .map(_mapList);
  }

  Stream<List<ReminderEntity>> watchAll() {
    return (_db.select(_db.reminders)
          ..orderBy([
            (r) => OrderingTerm(expression: r.date, mode: OrderingMode.asc),
          ]))
        .watch()
        .map(_mapList);
  }

  Future<int> insert(ReminderEntity entity) {
    return _db.into(_db.reminders).insert(
          RemindersCompanion.insert(
            id: entity.id,
            name: entity.name,
            frequency: entity.frequency,
            date: entity.date,
            time: entity.time,
            note: entity.note,
            isActive: entity.isActive,
          ),
          mode: InsertMode.insertOrReplace,
        );
  }

  Future<int> delete(String id) {
    return (_db.delete(_db.reminders)..where((r) => r.id.equals(id))).go();
  }

  Future<int> toggleActive(String id, bool active) {
    return (_db.update(_db.reminders)..where((r) => r.id.equals(id))).write(
      RemindersCompanion(isActive: Value(active ? 1 : 0)),
    );
  }

  List<ReminderEntity> _mapList(List<Reminder> rows) => rows
      .map(
        (r) => ReminderEntity(
          id: r.id,
          name: r.name,
          frequency: r.frequency,
          date: r.date,
          time: r.time,
          note: r.note,
          isActive: r.isActive,
        ),
      )
      .toList();
}
