import 'package:drift/drift.dart';

import '../../domain/entities/transaction_entity.dart';
import '../database/app_database.dart';

/// Repository for account/ledger management.
class AccountRepository {
  AccountRepository(this._db);

  final AppDatabase _db;

  Stream<List<AccountEntity>> watchAll() {
    return (_db.select(_db.accountEntries)
          ..orderBy([
            (a) => OrderingTerm(expression: a.id, mode: OrderingMode.asc),
          ]))
        .watch()
        .map(
          (rows) => rows
              .map(
                (r) => AccountEntity(
                  id: r.id,
                  entryName: r.entryName,
                  dateTime: r.entryDateTime,
                ),
              )
              .toList(),
        );
  }

  Future<List<AccountEntity>> getAll() async {
    final rows = await (_db.select(_db.accountEntries)
          ..orderBy([
            (a) => OrderingTerm(expression: a.id, mode: OrderingMode.asc),
          ]))
        .get();
    return rows
        .map(
          (r) => AccountEntity(
            id: r.id,
            entryName: r.entryName,
            dateTime: r.entryDateTime,
          ),
        )
        .toList();
  }

  Future<AccountEntity?> getById(int id) async {
    final row = await (_db.select(_db.accountEntries)
          ..where((a) => a.id.equals(id)))
        .getSingleOrNull();
    if (row == null) return null;
    return AccountEntity(
      id: row.id,
      entryName: row.entryName,
      dateTime: row.entryDateTime,
    );
  }

  Future<int> insert(AccountEntity entity) {
    return _db.into(_db.accountEntries).insert(
          AccountEntriesCompanion.insert(
            entryName: entity.entryName,
            entryDateTime: entity.dateTime,
          ),
        );
  }

  Future<bool> update(AccountEntity entity) {
    return _db.update(_db.accountEntries).replace(
          AccountEntry(
            id: entity.id!,
            entryName: entity.entryName,
            entryDateTime: entity.dateTime,
          ),
        );
  }

  Future<int> delete(int id) {
    return (_db.delete(_db.accountEntries)..where((a) => a.id.equals(id)))
        .go();
  }

  Future<int> count() async {
    final count = _db.accountEntries.id.count();
    final query = _db.selectOnly(_db.accountEntries)..addColumns([count]);
    final result = await query.getSingle();
    return result.read(count) ?? 0;
  }

  Future<Map<int, int>> getBalances() async {
    final accounts = await getAll();
    final balances = <int, int>{};
    for (final account in accounts) {
      balances[account.id!] = await _getAccountBalance(account.id!);
    }
    return balances;
  }

  Future<int> _getAccountBalance(int accountId) async {
    final transactions = await (_db.select(_db.incomeTable)
          ..where((t) => t.accountId.equals(accountId)))
        .get();

    var balance = 0;
    for (final tx in transactions) {
      switch (tx.type) {
        case 'income':
          balance += tx.amount;
        case 'expense':
          balance -= tx.amount;
        case 'transfer':
          break;
      }
    }
    return balance;
  }

  Future<int> getTotalBalance() async {
    final balances = await getBalances();
    return balances.values.fold<int>(0, (sum, b) => sum + b);
  }
}
