/// Filters applied when exporting transactions to PDF or Excel.
class ExportOptions {
  const ExportOptions({
    this.transactionType = ExportTransactionTypeFilter.both,
    this.recordType = ExportRecordTypeFilter.both,
    this.allAccounts = true,
    this.accountIds = const {},
    this.allDates = true,
    this.startDate,
    this.endDate,
  });

  final ExportTransactionTypeFilter transactionType;
  final ExportRecordTypeFilter recordType;
  final bool allAccounts;
  final Set<int> accountIds;
  final bool allDates;
  final DateTime? startDate;
  final DateTime? endDate;

  ExportOptions copyWith({
    ExportTransactionTypeFilter? transactionType,
    ExportRecordTypeFilter? recordType,
    bool? allAccounts,
    Set<int>? accountIds,
    bool? allDates,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return ExportOptions(
      transactionType: transactionType ?? this.transactionType,
      recordType: recordType ?? this.recordType,
      allAccounts: allAccounts ?? this.allAccounts,
      accountIds: accountIds ?? this.accountIds,
      allDates: allDates ?? this.allDates,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  String get dateRangeLabel {
    if (allDates) return 'All dates';
    if (startDate != null && endDate != null) {
      return '${_formatDate(startDate!)} – ${_formatDate(endDate!)}';
    }
    if (startDate != null) return 'From ${_formatDate(startDate!)}';
    if (endDate != null) return 'Until ${_formatDate(endDate!)}';
    return 'All dates';
  }

  static String _formatDate(DateTime date) =>
      '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}

enum ExportFormat { zip, pdf, excel }

enum ExportTransactionTypeFilter { expense, income, both }

enum ExportRecordTypeFilter { money, grain, both }

extension ExportTransactionTypeFilterLabel on ExportTransactionTypeFilter {
  String get label => switch (this) {
        ExportTransactionTypeFilter.expense => 'Expense',
        ExportTransactionTypeFilter.income => 'Income',
        ExportTransactionTypeFilter.both => 'Both',
      };
}

extension ExportRecordTypeFilterLabel on ExportRecordTypeFilter {
  String get label => switch (this) {
        ExportRecordTypeFilter.money => 'Money',
        ExportRecordTypeFilter.grain => 'Grain',
        ExportRecordTypeFilter.both => 'Both',
      };
}
