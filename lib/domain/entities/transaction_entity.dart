import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_entity.freezed.dart';

/// Domain entity representing a CashBook transaction.
@freezed
abstract class TransactionEntity with _$TransactionEntity {
  const factory TransactionEntity({
    int? id,
    required int accountId,
    required int categoryId,
    required String date,
    required String time,
    required int amount,
    required String name,
    required String category,
    required String remark,
    required String paymentMode,
    required String lastEditedDate,
    required String lastEditedTime,
    required String imageUris,
    required String type,
    required int isHeader,
    @Default(0) int isBookmarked,
    String? fromAccount,
    String? toAccount,
    String? transferType,
  }) = _TransactionEntity;

  const TransactionEntity._();

  bool get isIncome => type == 'income';
  bool get isExpense => type == 'expense';
  bool get isTransfer => type == 'transfer';
  bool get isGrain =>
      type == 'grain' || type == 'grain_in' || type == 'grain_out';
  bool get isGrainIn => type == 'grain_in' || type == 'grain';
  bool get isGrainOut => type == 'grain_out';
  bool get isBookmark => isBookmarked == 1;
  bool get hasImages => imageUris != '[]' && imageUris.isNotEmpty;
}

@freezed
abstract class AccountEntity with _$AccountEntity {
  const factory AccountEntity({
    int? id,
    required String entryName,
    required String dateTime,
  }) = _AccountEntity;
}

@freezed
abstract class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    int? id,
    required String categoryName,
  }) = _CategoryEntity;
}

@freezed
abstract class PayModeEntity with _$PayModeEntity {
  const factory PayModeEntity({
    int? id,
    required String payModeName,
  }) = _PayModeEntity;
}

@freezed
abstract class ReminderEntity with _$ReminderEntity {
  const factory ReminderEntity({
    required String id,
    required String name,
    required String frequency,
    required String date,
    required String time,
    required String note,
    required int isActive,
  }) = _ReminderEntity;
}

@freezed
abstract class DashboardSummary with _$DashboardSummary {
  const factory DashboardSummary({
    required int totalBalance,
    required int todayIncome,
    required int todayExpense,
    required int monthlyIncome,
    required int monthlyExpense,
    required int budgetLimit,
    required int budgetSpent,
  }) = _DashboardSummary;
}

@freezed
abstract class ReportData with _$ReportData {
  const factory ReportData({
    required int totalIncome,
    required int totalExpense,
    required int totalTransfer,
    required Map<String, int> categoryBreakdown,
    required Map<String, int> paymentModeBreakdown,
    required Map<String, int> accountBreakdown,
    required List<ChartPoint> dailyPoints,
  }) = _ReportData;
}

@freezed
abstract class ChartPoint with _$ChartPoint {
  const factory ChartPoint({
    required String label,
    required int income,
    required int expense,
  }) = _ChartPoint;
}

@freezed
abstract class SearchFilter with _$SearchFilter {
  const factory SearchFilter({
    String? query,
    String? type,
    int? accountId,
    String? category,
    String? paymentMode,
    DateTime? startDate,
    DateTime? endDate,
    bool? bookmarkedOnly,
    int? minAmount,
    int? maxAmount,
  }) = _SearchFilter;
}

/// Grain analytics for the reports screen.
class GrainReportData {
  const GrainReportData({
    required this.totalIn,
    required this.totalOut,
    required this.accountBreakdownIn,
    required this.accountBreakdownOut,
    required this.dailyPoints,
  });

  final int totalIn;
  final int totalOut;
  final Map<String, int> accountBreakdownIn;
  final Map<String, int> accountBreakdownOut;
  final List<GrainChartPoint> dailyPoints;
}

class GrainChartPoint {
  const GrainChartPoint({
    required this.label,
    required this.grainIn,
    required this.grainOut,
  });

  final String label;
  final int grainIn;
  final int grainOut;
}
