import 'package:drift/drift.dart';

import '../../core/utils/date_utils.dart';
import '../../domain/entities/transaction_entity.dart';
import '../database/app_database.dart';

/// Repository for transaction CRUD and queries.
class TransactionRepository {
  TransactionRepository(this._db);

  final AppDatabase _db;

  Stream<List<TransactionEntity>> watchAll({int? limit}) {
    return _db.select(_db.incomeTable).watch().map((rows) {
      final sorted = _mapList(rows);
      return _applyLimit(sorted, limit);
    });
  }

  Stream<List<TransactionEntity>> watchByAccount(int accountId) {
    return (_db.select(
      _db.incomeTable,
    )..where((t) => t.accountId.equals(accountId))).watch().map(_mapList);
  }

  Future<List<TransactionEntity>> search(SearchFilter filter) async {
    var query = _db.select(_db.incomeTable);

    if (filter.type != null && filter.type!.isNotEmpty) {
      query = query..where((t) => t.type.equals(filter.type!));
    }
    if (filter.accountId != null) {
      query = query..where((t) => t.accountId.equals(filter.accountId!));
    }
    if (filter.category != null && filter.category!.isNotEmpty) {
      query = query..where((t) => t.category.equals(filter.category!));
    }
    if (filter.paymentMode != null && filter.paymentMode!.isNotEmpty) {
      query = query..where((t) => t.paymentMode.equals(filter.paymentMode!));
    }
    if (filter.bookmarkedOnly == true) {
      query = query..where((t) => t.isBookmarked.equals(1));
    }
    if (filter.minAmount != null) {
      query = query
        ..where((t) => t.amount.isBiggerOrEqualValue(filter.minAmount!));
    }
    if (filter.maxAmount != null) {
      query = query
        ..where((t) => t.amount.isSmallerOrEqualValue(filter.maxAmount!));
    }

    final results = await query.get();
    var mapped = _mapList(results);

    if (filter.query != null && filter.query!.isNotEmpty) {
      final q = filter.query!.toLowerCase();
      mapped = mapped.where((t) {
        return t.name.toLowerCase().contains(q) ||
            t.remark.toLowerCase().contains(q) ||
            t.category.toLowerCase().contains(q) ||
            t.paymentMode.toLowerCase().contains(q) ||
            t.amount.toString().contains(q) ||
            t.date.toLowerCase().contains(q);
      }).toList();
    }

    if (filter.startDate != null || filter.endDate != null) {
      mapped = mapped.where((transaction) {
        final parsed = CashBookDateUtils.parseDate(transaction.date);
        if (parsed == null) return true;
        if (filter.startDate != null && parsed.isBefore(filter.startDate!)) {
          return false;
        }
        if (filter.endDate != null && parsed.isAfter(filter.endDate!)) {
          return false;
        }
        return true;
      }).toList();
    }

    return mapped;
  }

  Future<TransactionEntity?> getById(int id) async {
    final row = await (_db.select(
      _db.incomeTable,
    )..where((t) => t.id.equals(id))).getSingleOrNull();
    return row == null ? null : _mapRow(row);
  }

  Future<int> insert(TransactionEntity entity) {
    return _db.into(_db.incomeTable).insert(_toCompanion(entity));
  }

  Future<bool> update(TransactionEntity entity) {
    return _db.update(_db.incomeTable).replace(_toData(entity));
  }

  Future<int> delete(int id) {
    return (_db.delete(_db.incomeTable)..where((t) => t.id.equals(id))).go();
  }

  Future<int> toggleBookmark(int id, bool bookmarked) {
    return (_db.update(_db.incomeTable)..where((t) => t.id.equals(id))).write(
      IncomeTableCompanion(isBookmarked: Value(bookmarked ? 1 : 0)),
    );
  }

  Future<int> count() async {
    final countExpr = _db.incomeTable.id.count();
    final query = _db.selectOnly(_db.incomeTable)..addColumns([countExpr]);
    final result = await query.getSingle();
    return result.read(countExpr) ?? 0;
  }

  Future<List<TransactionEntity>> getAll() async {
    final rows = await _db.select(_db.incomeTable).get();
    return _mapList(rows);
  }

  List<TransactionEntity> _applyLimit(
    List<TransactionEntity> transactions,
    int? limit,
  ) {
    if (limit != null && transactions.length > limit) {
      return transactions.sublist(0, limit);
    }
    return transactions;
  }

  List<TransactionEntity> _mapList(List<IncomeTableData> rows) {
    final list = rows.map(_mapRow).toList();
    list.sort(_compareNewestFirst);
    return list;
  }

  int _compareNewestFirst(TransactionEntity a, TransactionEntity b) {
    final dateCmp = CashBookDateUtils.compareTransactionDateTimeDesc(
      dateA: a.date,
      timeA: a.time,
      dateB: b.date,
      timeB: b.time,
    );
    if (dateCmp != 0) return dateCmp;

    return (b.id ?? 0).compareTo(a.id ?? 0);
  }

  TransactionEntity _mapRow(IncomeTableData row) => TransactionEntity(
    id: row.id,
    accountId: row.accountId,
    categoryId: row.categoryId,
    date: row.date,
    time: row.time,
    amount: row.amount,
    name: row.name,
    category: row.category,
    remark: row.remark,
    paymentMode: row.paymentMode,
    lastEditedDate: row.lastEditedDate,
    lastEditedTime: row.lastEditedTime,
    imageUris: row.imageUris,
    type: row.type,
    isHeader: row.isHeader,
    isBookmarked: row.isBookmarked,
    fromAccount: row.fromAccount,
    toAccount: row.toAccount,
    transferType: row.transferType,
  );

  IncomeTableCompanion _toCompanion(TransactionEntity e) =>
      IncomeTableCompanion.insert(
        accountId: e.accountId,
        categoryId: e.categoryId,
        date: e.date,
        time: e.time,
        amount: e.amount,
        name: e.name,
        category: e.category,
        remark: e.remark,
        paymentMode: e.paymentMode,
        lastEditedDate: e.lastEditedDate,
        lastEditedTime: e.lastEditedTime,
        imageUris: e.imageUris,
        type: e.type,
        isHeader: e.isHeader,
        isBookmarked: Value(e.isBookmarked),
        fromAccount: Value(e.fromAccount),
        toAccount: Value(e.toAccount),
        transferType: Value(e.transferType),
      );

  IncomeTableData _toData(TransactionEntity e) => IncomeTableData(
    id: e.id!,
    accountId: e.accountId,
    categoryId: e.categoryId,
    date: e.date,
    time: e.time,
    amount: e.amount,
    name: e.name,
    category: e.category,
    remark: e.remark,
    paymentMode: e.paymentMode,
    lastEditedDate: e.lastEditedDate,
    lastEditedTime: e.lastEditedTime,
    imageUris: e.imageUris,
    type: e.type,
    isHeader: e.isHeader,
    isBookmarked: e.isBookmarked,
    fromAccount: e.fromAccount,
    toAccount: e.toAccount,
    transferType: e.transferType,
  );
}
