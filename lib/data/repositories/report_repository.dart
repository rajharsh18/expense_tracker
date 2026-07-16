import '../../core/utils/date_utils.dart';
import '../../domain/entities/transaction_entity.dart';
import '../database/app_database.dart';
import 'account_repository.dart';

/// Repository for analytics and report generation.
class ReportRepository {
  ReportRepository(this._db, this._accountRepo);

  final AppDatabase _db;
  final AccountRepository _accountRepo;

  Future<ReportData> getReport({
    required DateTime start,
    required DateTime end,
    int? accountId,
  }) async {
    var query = _db.select(_db.incomeTable);
    if (accountId != null) {
      query = query..where((t) => t.accountId.equals(accountId));
    }
    final transactions = await query.get();

    var totalIncome = 0;
    var totalExpense = 0;
    var totalTransfer = 0;
    final categoryBreakdown = <String, int>{};
    final paymentModeBreakdown = <String, int>{};
    final accountBreakdown = <String, int>{};
    final dailyMap = <String, ChartPoint>{};

    final accounts = await _accountRepo.getAll();
    final accountMap = {for (final a in accounts) a.id!: a.entryName};

    for (final tx in transactions) {
      if (tx.type == 'grain' ||
          tx.type == 'grain_in' ||
          tx.type == 'grain_out') {
        continue;
      }

      final txDate = CashBookDateUtils.parseDate(tx.date);
      if (txDate == null) continue;
      if (txDate.isBefore(start) || txDate.isAfter(end)) continue;

      switch (tx.type) {
        case 'income':
          totalIncome += tx.amount;
        case 'expense':
          totalExpense += tx.amount;
          final cat = tx.category.isEmpty ? 'Uncategorized' : tx.category;
          categoryBreakdown[cat] = (categoryBreakdown[cat] ?? 0) + tx.amount;
        case 'transfer':
          totalTransfer += tx.amount;
      }

      if (tx.paymentMode.isNotEmpty) {
        paymentModeBreakdown[tx.paymentMode] =
            (paymentModeBreakdown[tx.paymentMode] ?? 0) + tx.amount;
      }

      final accountName = accountMap[tx.accountId] ?? 'Unknown';
      accountBreakdown[accountName] =
          (accountBreakdown[accountName] ?? 0) + tx.amount;

      final dayKey = CashBookDateUtils.formatDate(txDate);
      final existing = dailyMap[dayKey];
      if (existing == null) {
        dailyMap[dayKey] = ChartPoint(
          label: dayKey,
          income: tx.type == 'income' ? tx.amount : 0,
          expense: tx.type == 'expense' ? tx.amount : 0,
        );
      } else {
        dailyMap[dayKey] = ChartPoint(
          label: dayKey,
          income: existing.income + (tx.type == 'income' ? tx.amount : 0),
          expense: existing.expense + (tx.type == 'expense' ? tx.amount : 0),
        );
      }
    }

    final dailyPoints = dailyMap.values.toList()
      ..sort((a, b) {
        final da = CashBookDateUtils.parseDate(a.label);
        final db = CashBookDateUtils.parseDate(b.label);
        if (da == null || db == null) return 0;
        return da.compareTo(db);
      });

    return ReportData(
      totalIncome: totalIncome,
      totalExpense: totalExpense,
      totalTransfer: totalTransfer,
      categoryBreakdown: categoryBreakdown,
      paymentModeBreakdown: paymentModeBreakdown,
      accountBreakdown: accountBreakdown,
      dailyPoints: dailyPoints,
    );
  }

  Future<DashboardSummary> getDashboardSummary(int budgetLimit) async {
    final now = DateTime.now();
    final todayStart = CashBookDateUtils.startOfDay(now);
    final todayEnd = CashBookDateUtils.endOfDay(now);
    final monthStart = CashBookDateUtils.startOfMonth(now);
    final monthEnd = CashBookDateUtils.endOfMonth(now);

    final allTransactions = await _db.select(_db.incomeTable).get();
    final totalBalance = await _accountRepo.getTotalBalance();

    var todayIncome = 0;
    var todayExpense = 0;
    var monthlyIncome = 0;
    var monthlyExpense = 0;

    for (final tx in allTransactions) {
      final txDate = CashBookDateUtils.parseDate(tx.date);
      if (txDate == null) continue;

      if (CashBookDateUtils.isInRange(txDate, todayStart, todayEnd)) {
        if (tx.type == 'income') todayIncome += tx.amount;
        if (tx.type == 'expense') todayExpense += tx.amount;
      }

      if (CashBookDateUtils.isInRange(txDate, monthStart, monthEnd)) {
        if (tx.type == 'income') monthlyIncome += tx.amount;
        if (tx.type == 'expense') monthlyExpense += tx.amount;
      }
    }

    return DashboardSummary(
      totalBalance: totalBalance,
      todayIncome: todayIncome,
      todayExpense: todayExpense,
      monthlyIncome: monthlyIncome,
      monthlyExpense: monthlyExpense,
      budgetLimit: budgetLimit,
      budgetSpent: monthlyExpense,
    );
  }

  Future<List<ChartPoint>> getWeeklyChart() async {
    final now = DateTime.now();
    final start = CashBookDateUtils.startOfWeek(now);
    final report = await getReport(start: start, end: now);
    return report.dailyPoints;
  }

  Future<List<ChartPoint>> getMonthlyChart() async {
    final now = DateTime.now();
    final start = CashBookDateUtils.startOfMonth(now);
    final report = await getReport(start: start, end: now);
    return report.dailyPoints;
  }

  Future<Map<String, int>> getTopCategories({int limit = 5}) async {
    final now = DateTime.now();
    final start = CashBookDateUtils.startOfMonth(now);
    final report = await getReport(start: start, end: now);
    final sorted = report.categoryBreakdown.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return Map.fromEntries(sorted.take(limit));
  }

  Future<List<TransactionEntity>> getTransferReport({
    required DateTime start,
    required DateTime end,
  }) async {
    final rows = await (_db.select(
      _db.incomeTable,
    )..where((t) => t.type.equals('transfer'))).get();

    return rows
        .where((tx) {
          final date = CashBookDateUtils.parseDate(tx.date);
          if (date == null) return false;
          return CashBookDateUtils.isInRange(date, start, end);
        })
        .map(
          (row) => TransactionEntity(
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
          ),
        )
        .toList();
  }

  Future<GrainReportData> getGrainReport({
    required DateTime start,
    required DateTime end,
  }) async {
    final transactions = await _db.select(_db.incomeTable).get();

    var totalIn = 0;
    var totalOut = 0;
    final accountBreakdownIn = <String, int>{};
    final accountBreakdownOut = <String, int>{};
    final dailyMap = <String, GrainChartPoint>{};

    final accounts = await _accountRepo.getAll();
    final accountMap = {for (final a in accounts) a.id!: a.entryName};

    for (final tx in transactions) {
      final isIn = tx.type == 'grain_in' || tx.type == 'grain';
      final isOut = tx.type == 'grain_out';
      if (!isIn && !isOut) continue;

      final txDate = CashBookDateUtils.parseDate(tx.date);
      if (txDate == null) continue;
      if (txDate.isBefore(start) || txDate.isAfter(end)) continue;

      final accountName = accountMap[tx.accountId] ?? 'Unknown';
      final dayKey = CashBookDateUtils.formatDate(txDate);

      if (isIn) {
        totalIn += tx.amount;
        accountBreakdownIn[accountName] =
            (accountBreakdownIn[accountName] ?? 0) + tx.amount;
      } else {
        totalOut += tx.amount;
        accountBreakdownOut[accountName] =
            (accountBreakdownOut[accountName] ?? 0) + tx.amount;
      }

      final existing = dailyMap[dayKey];
      if (existing == null) {
        dailyMap[dayKey] = GrainChartPoint(
          label: dayKey,
          grainIn: isIn ? tx.amount : 0,
          grainOut: isOut ? tx.amount : 0,
        );
      } else {
        dailyMap[dayKey] = GrainChartPoint(
          label: dayKey,
          grainIn: existing.grainIn + (isIn ? tx.amount : 0),
          grainOut: existing.grainOut + (isOut ? tx.amount : 0),
        );
      }
    }

    final dailyPoints = dailyMap.values.toList()
      ..sort((a, b) {
        final da = CashBookDateUtils.parseDate(a.label);
        final db = CashBookDateUtils.parseDate(b.label);
        if (da == null || db == null) return 0;
        return da.compareTo(db);
      });

    return GrainReportData(
      totalIn: totalIn,
      totalOut: totalOut,
      accountBreakdownIn: accountBreakdownIn,
      accountBreakdownOut: accountBreakdownOut,
      dailyPoints: dailyPoints,
    );
  }
}
