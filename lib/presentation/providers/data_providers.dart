import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/date_utils.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../data/database/database_holder.dart';
import 'app_providers.dart';

final transactionsProvider = StreamProvider.autoDispose<List<TransactionEntity>>((ref) {
  ref.watch(databaseRefreshProvider);
  return ref.watch(transactionRepositoryProvider).watchAll();
});

final recentTransactionsProvider =
    StreamProvider.autoDispose<List<TransactionEntity>>((ref) {
  ref.watch(databaseRefreshProvider);
  return ref.watch(transactionRepositoryProvider).watchAll(limit: 10);
});

final accountsProvider = StreamProvider.autoDispose<List<AccountEntity>>((ref) {
  ref.watch(databaseRefreshProvider);
  return ref.watch(accountRepositoryProvider).watchAll();
});

final categoriesProvider =
    StreamProvider.autoDispose<List<CategoryEntity>>((ref) {
  ref.watch(databaseRefreshProvider);
  return ref.watch(categoryRepositoryProvider).watchAll();
});

final paymentModesProvider =
    StreamProvider.autoDispose<List<PayModeEntity>>((ref) {
  ref.watch(databaseRefreshProvider);
  return ref.watch(paymentModeRepositoryProvider).watchAll();
});

final remindersProvider =
    StreamProvider.autoDispose<List<ReminderEntity>>((ref) {
  ref.watch(databaseRefreshProvider);
  return ref.watch(reminderRepositoryProvider).watchActive();
});

final dashboardSummaryProvider =
    FutureProvider.autoDispose<DashboardSummary>((ref) async {
  ref.watch(databaseRefreshProvider);
  final budget = ref.watch(budgetLimitProvider);
  return ref.watch(reportRepositoryProvider).getDashboardSummary(budget);
});

final weeklyChartProvider =
    FutureProvider.autoDispose<List<ChartPoint>>((ref) async {
  ref.watch(databaseRefreshProvider);
  return ref.watch(reportRepositoryProvider).getWeeklyChart();
});

final monthlyChartProvider =
    FutureProvider.autoDispose<List<ChartPoint>>((ref) async {
  ref.watch(databaseRefreshProvider);
  return ref.watch(reportRepositoryProvider).getMonthlyChart();
});

final accountBalancesProvider =
    FutureProvider.autoDispose<Map<int, int>>((ref) async {
  ref.watch(databaseRefreshProvider);
  return ref.watch(accountRepositoryProvider).getBalances();
});

final searchFilterProvider =
    StateProvider<SearchFilter>((ref) => const SearchFilter());

final searchResultsProvider =
    FutureProvider.autoDispose<List<TransactionEntity>>((ref) async {
  ref.watch(databaseRefreshProvider);
  final filter = ref.watch(searchFilterProvider);
  return ref.watch(transactionRepositoryProvider).search(filter);
});

enum ReportPeriod { weekly, monthly, yearly }

enum ReportMode { money, grains }

final reportModeProvider =
    StateProvider<ReportMode>((ref) => ReportMode.money);

final reportPeriodProvider =
    StateProvider<ReportPeriod>((ref) => ReportPeriod.monthly);

/// Anchor date for the selected report week, month, or year.
final reportAnchorDateProvider =
    StateProvider<DateTime>((ref) => DateTime.now());

final reportDataProvider = FutureProvider.autoDispose<ReportData>((ref) async {
  ref.watch(databaseRefreshProvider);
  final period = ref.watch(reportPeriodProvider);
  final anchor = ref.watch(reportAnchorDateProvider);
  late DateTime start;
  late DateTime end;

  switch (period) {
    case ReportPeriod.weekly:
      start = CashBookDateUtils.startOfWeek(anchor);
      end = CashBookDateUtils.endOfWeek(anchor);
    case ReportPeriod.monthly:
      start = CashBookDateUtils.startOfMonth(anchor);
      end = CashBookDateUtils.endOfMonth(anchor);
    case ReportPeriod.yearly:
      start = CashBookDateUtils.startOfYear(anchor);
      end = CashBookDateUtils.endOfYear(anchor);
  }

  return ref.watch(reportRepositoryProvider).getReport(start: start, end: end);
});

final grainReportDataProvider =
    FutureProvider.autoDispose<GrainReportData>((ref) async {
  ref.watch(databaseRefreshProvider);
  final period = ref.watch(reportPeriodProvider);
  final anchor = ref.watch(reportAnchorDateProvider);
  late DateTime start;
  late DateTime end;

  switch (period) {
    case ReportPeriod.weekly:
      start = CashBookDateUtils.startOfWeek(anchor);
      end = CashBookDateUtils.endOfWeek(anchor);
    case ReportPeriod.monthly:
      start = CashBookDateUtils.startOfMonth(anchor);
      end = CashBookDateUtils.endOfMonth(anchor);
    case ReportPeriod.yearly:
      start = CashBookDateUtils.startOfYear(anchor);
      end = CashBookDateUtils.endOfYear(anchor);
  }

  return ref.watch(reportRepositoryProvider).getGrainReport(
        start: start,
        end: end,
      );
});
