import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/amount_formatter.dart';
import '../../../core/utils/weight_formatter.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../../core/utils/date_utils.dart';
import '../../providers/app_providers.dart';
import '../../providers/data_providers.dart';
import '../../models/transaction_filters.dart';
import '../../widgets/charts.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/scaled_amount_text.dart';

/// Analytics and reports screen.
class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(reportDataProvider);
    final grainReportAsync = ref.watch(grainReportDataProvider);
    final period = ref.watch(reportPeriodProvider);
    final reportMode = ref.watch(reportModeProvider);
    final theme = AppThemeExtension.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        actions: [
          SegmentedButton<ReportPeriod>(
            segments: const [
              ButtonSegment(
                value: ReportPeriod.weekly,
                label: Text('W'),
              ),
              ButtonSegment(
                value: ReportPeriod.monthly,
                label: Text('M'),
              ),
              ButtonSegment(
                value: ReportPeriod.yearly,
                label: Text('Y'),
              ),
            ],
            selected: {period},
            onSelectionChanged: (s) =>
                ref.read(reportPeriodProvider.notifier).state = s.first,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              children: [
                SegmentedButton<ReportMode>(
                  segments: const [
                    ButtonSegment(value: ReportMode.money, label: Text('Money')),
                    ButtonSegment(value: ReportMode.grains, label: Text('Grains')),
                  ],
                  selected: {reportMode},
                  onSelectionChanged: (s) =>
                      ref.read(reportModeProvider.notifier).state = s.first,
                ),
                const SizedBox(height: 12),
                _ReportPeriodSelector(period: period),
              ],
            ),
          ),
          Expanded(
            child: reportMode == ReportMode.money
                ? reportAsync.when(
                    data: (report) =>
                        _MoneyReportView(report: report, theme: theme),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text('Error: $e')),
                  )
                : grainReportAsync.when(
                    data: (report) => _GrainReportView(report: report, theme: theme),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Center(child: Text('Error: $e')),
                  ),
          ),
        ],
      ),
    );
  }
}

class _MoneyReportView extends ConsumerWidget {
  const _MoneyReportView({required this.report, required this.theme});

  final ReportData report;
  final AppThemeExtension theme;

  Future<void> _openAccountTransactions(
    WidgetRef ref,
    BuildContext context,
    String accountName,
  ) async {
    if (accountName.trim().isEmpty || accountName == 'Unknown') return;

    final accounts = await ref.read(accountRepositoryProvider).getAll();
    final normalized = accountName.trim().toLowerCase();

    AccountEntity? match;
    for (final account in accounts) {
      if (account.entryName.trim().toLowerCase() == normalized) {
        match = account;
        break;
      }
    }
    if (match?.id == null) return;

    ref.read(transactionFiltersProvider.notifier).setAccountId(match!.id);
    ref.read(shellTabRequestProvider.notifier).state = 1;
    context.go(AppRouter.transactions);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            Expanded(
              child: _ReportStatCard(
                label: 'Income',
                amount: report.totalIncome,
                color: theme.incomeColor,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _ReportStatCard(
                label: 'Expense',
                amount: report.totalExpense,
                color: theme.expenseColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GlassCard(
          child: _ReportStatCard(
            label: 'Net',
            amount: report.totalIncome - report.totalExpense,
            color: theme.netColor(report.totalIncome - report.totalExpense),
            compact: true,
            signed: true,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Income vs Expense',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        GlassCard(
          padding: const EdgeInsets.all(12),
          child: ExpenseLineChart(data: report.dailyPoints),
        ),
        const SizedBox(height: 24),
        Text(
          'Payment Mode Report',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        GlassCard(
          child: Builder(
            builder: (context) {
              final entries = report.paymentModeBreakdown.entries.toList()
                ..sort(
                  (a, b) => (b.value.income - b.value.expense)
                      .compareTo(a.value.income - a.value.expense),
                );

              return Column(
                children: entries
                    .map(
                      (e) => _IncomeExpenseNetBreakdownRow(
                        label: e.key,
                        income: e.value.income,
                        expense: e.value.expense,
                        theme: theme,
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Account-wise Report',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        GlassCard(
          child: Builder(
            builder: (context) {
              final entries = report.accountBreakdown.entries.toList()
                ..sort(
                  (a, b) => (b.value.income - b.value.expense)
                      .compareTo(a.value.income - a.value.expense),
                );

              return Column(
                children: entries
                    .map(
                      (e) => _IncomeExpenseNetBreakdownRow(
                        label: e.key,
                        income: e.value.income,
                        expense: e.value.expense,
                        theme: theme,
                        onTap: () =>
                            _openAccountTransactions(ref, context, e.key),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}

class _GrainReportView extends StatelessWidget {
  const _GrainReportView({required this.report, required this.theme});

  final GrainReportData report;
  final AppThemeExtension theme;

  @override
  Widget build(BuildContext context) {
    final chartData = report.dailyPoints
        .map(
          (p) => ChartPoint(
            label: p.label,
            income: p.grainIn,
            expense: p.grainOut,
          ),
        )
        .toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          children: [
            Expanded(
              child: _GrainStatCard(
                label: 'IN',
                grams: report.totalIn,
                color: const Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _GrainStatCard(
                label: 'OUT',
                grams: report.totalOut,
                color: const Color(0xFF8D6E63),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GlassCard(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _GrainStatCard(
                label: 'Net',
                grams: report.totalIn - report.totalOut,
                color: theme.netColor(report.totalIn - report.totalOut),
                compact: true,
                signed: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'IN vs OUT',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        GlassCard(
          padding: const EdgeInsets.all(12),
          child: ExpenseLineChart(
            data: chartData,
            showIncome: true,
            showExpense: true,
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Account-wise IN',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        GlassCard(
          child: Column(
            children: report.accountBreakdownIn.entries
                .map(
                  (e) => _GrainBreakdownRow(
                    label: e.key,
                    grams: e.value,
                    total: report.totalIn,
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Account-wise OUT',
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        GlassCard(
          child: Column(
            children: report.accountBreakdownOut.entries
                .map(
                  (e) => _GrainBreakdownRow(
                    label: e.key,
                    grams: e.value,
                    total: report.totalOut,
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 100),
      ],
    );
  }
}

class _ReportPeriodSelector extends ConsumerWidget {
  const _ReportPeriodSelector({required this.period});

  final ReportPeriod period;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final anchor = ref.watch(reportAnchorDateProvider);
    final now = DateTime.now();
    final canGoForward = switch (period) {
      ReportPeriod.weekly =>
        CashBookDateUtils.startOfWeek(anchor).isBefore(
          CashBookDateUtils.startOfWeek(now),
        ),
      ReportPeriod.monthly =>
        CashBookDateUtils.startOfMonth(anchor).isBefore(
          CashBookDateUtils.startOfMonth(now),
        ),
      ReportPeriod.yearly =>
        CashBookDateUtils.startOfYear(anchor).isBefore(
          CashBookDateUtils.startOfYear(now),
        ),
    };

    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => _shiftPeriod(ref, -1),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => _pickPeriod(context, ref),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  _formatLabel(anchor),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: canGoForward ? () => _shiftPeriod(ref, 1) : null,
          ),
        ],
      ),
    );
  }

  String _formatLabel(DateTime anchor) {
    switch (period) {
      case ReportPeriod.weekly:
        final start = CashBookDateUtils.startOfWeek(anchor);
        final end = CashBookDateUtils.endOfWeek(anchor);
        if (start.year == end.year) {
          return 'Sun ${DateFormat('d MMM').format(start)} – Sat ${DateFormat('d MMM yyyy').format(end)}';
        }
        return 'Sun ${DateFormat('d MMM yyyy').format(start)} – Sat ${DateFormat('d MMM yyyy').format(end)}';
      case ReportPeriod.monthly:
        return DateFormat('MMMM yyyy').format(anchor);
      case ReportPeriod.yearly:
        return DateFormat('yyyy').format(anchor);
    }
  }

  void _shiftPeriod(WidgetRef ref, int delta) {
    final anchor = ref.read(reportAnchorDateProvider);
    final next = switch (period) {
      ReportPeriod.weekly => anchor.add(Duration(days: 7 * delta)),
      ReportPeriod.monthly => DateTime(anchor.year, anchor.month + delta, 1),
      ReportPeriod.yearly => DateTime(anchor.year + delta, anchor.month, anchor.day),
    };
    ref.read(reportAnchorDateProvider.notifier).state = next;
  }

  Future<void> _pickPeriod(BuildContext context, WidgetRef ref) async {
    final anchor = ref.read(reportAnchorDateProvider);
    final now = DateTime.now();

    switch (period) {
      case ReportPeriod.weekly:
        final date = await showDatePicker(
          context: context,
          initialDate: anchor,
          firstDate: DateTime(2000),
          lastDate: now,
        );
        if (date != null) {
          ref.read(reportAnchorDateProvider.notifier).state = date;
        }
      case ReportPeriod.monthly:
        final picked = await showDialog<DateTime>(
          context: context,
          builder: (context) => _MonthYearPickerDialog(
            initialDate: anchor,
            firstDate: DateTime(2000),
            lastDate: now,
          ),
        );
        if (picked != null) {
          ref.read(reportAnchorDateProvider.notifier).state = picked;
        }
      case ReportPeriod.yearly:
        final year = await showDialog<int>(
          context: context,
          builder: (context) => _YearPickerDialog(
            initialYear: anchor.year,
            firstYear: 2000,
            lastYear: now.year,
          ),
        );
        if (year != null) {
          ref.read(reportAnchorDateProvider.notifier).state =
              DateTime(year, anchor.month, anchor.day);
        }
    }
  }
}

class _MonthYearPickerDialog extends StatefulWidget {
  const _MonthYearPickerDialog({
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
  });

  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  @override
  State<_MonthYearPickerDialog> createState() => _MonthYearPickerDialogState();
}

class _MonthYearPickerDialogState extends State<_MonthYearPickerDialog> {
  late int _year;
  late int _month;

  @override
  void initState() {
    super.initState();
    _year = widget.initialDate.year;
    _month = widget.initialDate.month;
  }

  bool get _canGoBack => _year > widget.firstDate.year ||
      (_year == widget.firstDate.year && _month > widget.firstDate.month);

  bool get _canGoForward => _year < widget.lastDate.year ||
      (_year == widget.lastDate.year && _month < widget.lastDate.month);

  @override
  Widget build(BuildContext context) {
    final months = List.generate(12, (i) => i + 1);

    return AlertDialog(
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: _canGoBack
                ? () => setState(() {
                      if (_month == 1) {
                        _month = 12;
                        _year--;
                      } else {
                        _month--;
                      }
                    })
                : null,
          ),
          Expanded(
            child: Text(
              '$_year',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: _canGoForward
                ? () => setState(() {
                      if (_month == 12) {
                        _month = 1;
                        _year++;
                      } else {
                        _month++;
                      }
                    })
                : null,
          ),
        ],
      ),
      content: SizedBox(
        width: double.maxFinite,
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 2.8,
          ),
          itemCount: months.length,
          itemBuilder: (context, index) {
            final month = months[index];
            final isSelected = month == _month;
            final monthStart = DateTime(_year, month, 1);
            final isEnabled = !monthStart.isAfter(
                  DateTime(widget.lastDate.year, widget.lastDate.month, 1),
                ) &&
                !monthStart.isBefore(
                  DateTime(widget.firstDate.year, widget.firstDate.month, 1),
                );

            return FilledButton.tonal(
              onPressed: isEnabled ? () => setState(() => _month = month) : null,
              style: FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                backgroundColor: isSelected
                    ? Theme.of(context).colorScheme.primaryContainer
                    : null,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  DateFormat('MMM').format(monthStart),
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, DateTime(_year, _month, 1)),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class _YearPickerDialog extends StatefulWidget {
  const _YearPickerDialog({
    required this.initialYear,
    required this.firstYear,
    required this.lastYear,
  });

  final int initialYear;
  final int firstYear;
  final int lastYear;

  @override
  State<_YearPickerDialog> createState() => _YearPickerDialogState();
}

class _YearPickerDialogState extends State<_YearPickerDialog> {
  late int _selectedYear;

  @override
  void initState() {
    super.initState();
    _selectedYear = widget.initialYear;
  }

  @override
  Widget build(BuildContext context) {
    final years = List.generate(
      widget.lastYear - widget.firstYear + 1,
      (i) => widget.lastYear - i,
    );

    return AlertDialog(
      title: const Text('Select Year'),
      content: SizedBox(
        width: double.maxFinite,
        height: 300,
        child: ListView.builder(
          itemCount: years.length,
          itemBuilder: (context, index) {
            final year = years[index];
            final isSelected = year == _selectedYear;
            return ListTile(
              title: Text('$year'),
              selected: isSelected,
              onTap: () => setState(() => _selectedYear = year),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(context, _selectedYear),
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class _ReportStatCard extends StatelessWidget {
  const _ReportStatCard({
    required this.label,
    required this.amount,
    required this.color,
    this.compact = false,
    this.signed = false,
  });

  final String label;
  final int amount;
  final Color color;
  final bool compact;
  final bool signed;

  String _formatAmount() {
    if (signed) {
      return AmountFormatter.formatSigned(amount.abs(), isExpense: amount < 0);
    }
    return AmountFormatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return Column(
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          ScaledAmountText(
            _formatAmount(),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      );
    }

    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 4),
          ScaledAmountText(
            _formatAmount(),
            alignment: Alignment.centerLeft,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _GrainStatCard extends StatelessWidget {
  const _GrainStatCard({
    required this.label,
    required this.grams,
    required this.color,
    this.compact = false,
    this.signed = false,
  });

  final String label;
  final int grams;
  final Color color;
  final bool compact;
  final bool signed;

  String _formatGrams() {
    if (signed) {
      final prefix = grams < 0 ? '-' : grams > 0 ? '+' : '';
      return '$prefix${WeightFormatter.format(grams.abs())}';
    }
    return WeightFormatter.format(grams);
  }

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return Column(
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          ScaledAmountText(
            _formatGrams(),
            style: TextStyle(fontWeight: FontWeight.w700, color: color),
          ),
        ],
      );
    }

    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 4),
          ScaledAmountText(
            _formatGrams(),
            alignment: Alignment.centerLeft,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _GrainBreakdownRow extends StatelessWidget {
  const _GrainBreakdownRow({
    required this.label,
    required this.grams,
    required this.total,
  });

  final String label;
  final int grams;
  final int total;

  @override
  Widget build(BuildContext context) {
    final fraction = total > 0 ? grams / total : 0.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              ScaledAmountText(
                WeightFormatter.format(grams),
                alignment: Alignment.centerRight,
                maxWidthFraction: 0.4,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: fraction,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}

class _IncomeExpenseNetBreakdownRow extends StatelessWidget {
  const _IncomeExpenseNetBreakdownRow({
    required this.label,
    required this.income,
    required this.expense,
    required this.theme,
    this.onTap,
  });

  final String label;
  final int income;
  final int expense;
  final AppThemeExtension theme;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final net = income - expense;

    final content = Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              if (onTap != null)
                Icon(
                  Icons.chevron_right,
                  size: 18,
                  color: Theme.of(context).colorScheme.outline,
                ),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: _BreakdownStat(
                  label: 'Income',
                  amount: income,
                  color: theme.incomeColor,
                ),
              ),
              Expanded(
                child: _BreakdownStat(
                  label: 'Expense',
                  amount: expense,
                  color: theme.expenseColor,
                ),
              ),
              Expanded(
                child: _BreakdownStat(
                  label: 'Net',
                  amount: net,
                  color: theme.netColor(net),
                  signed: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    if (onTap == null) return content;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: content,
      ),
    );
  }
}

class _BreakdownStat extends StatelessWidget {
  const _BreakdownStat({
    required this.label,
    required this.amount,
    required this.color,
    this.signed = false,
  });

  final String label;
  final int amount;
  final Color color;
  final bool signed;

  @override
  Widget build(BuildContext context) {
    final text = signed
        ? AmountFormatter.formatSigned(amount.abs(), isExpense: amount < 0)
        : AmountFormatter.format(amount);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 2),
        ScaledAmountText(
          text,
          alignment: Alignment.centerLeft,
          style: TextStyle(fontWeight: FontWeight.w600, color: color),
        ),
      ],
    );
  }
}
