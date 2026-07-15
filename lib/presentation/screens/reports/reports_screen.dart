import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/amount_formatter.dart';
import '../../providers/data_providers.dart';
import '../../widgets/charts.dart';
import '../../widgets/glass_card.dart';

/// Analytics and reports screen.
class ReportsScreen extends ConsumerWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportAsync = ref.watch(reportDataProvider);
    final period = ref.watch(reportPeriodProvider);
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
      body: reportAsync.when(
        data: (report) => ListView(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _ReportStatCard(
                    label: 'Net',
                    amount: report.totalIncome - report.totalExpense,
                    color: Theme.of(context).colorScheme.primary,
                    compact: true,
                  ),
                  _ReportStatCard(
                    label: 'Transfers',
                    amount: report.totalTransfer,
                    color: theme.transferColor,
                    compact: true,
                  ),
                ],
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
              'Category Breakdown',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            GlassCard(
              child: CategoryPieChart(data: report.categoryBreakdown),
            ),
            const SizedBox(height: 8),
            ...report.categoryBreakdown.entries.map(
              (e) => _BreakdownRow(
                label: e.key,
                amount: e.value,
                total: report.totalExpense,
              ),
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
              child: Column(
                children: report.paymentModeBreakdown.entries
                    .map(
                      (e) => _BreakdownRow(
                        label: e.key,
                        amount: e.value,
                        total: report.totalExpense + report.totalIncome,
                      ),
                    )
                    .toList(),
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
              child: Column(
                children: report.accountBreakdown.entries
                    .map(
                      (e) => _BreakdownRow(
                        label: e.key,
                        amount: e.value,
                        total: report.totalExpense + report.totalIncome,
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _ReportStatCard extends StatelessWidget {
  const _ReportStatCard({
    required this.label,
    required this.amount,
    required this.color,
    this.compact = false,
  });

  final String label;
  final int amount;
  final Color color;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return Column(
        children: [
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          Text(
            AmountFormatter.format(amount),
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
          Text(
            AmountFormatter.format(amount),
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

class _BreakdownRow extends StatelessWidget {
  const _BreakdownRow({
    required this.label,
    required this.amount,
    required this.total,
  });

  final String label;
  final int amount;
  final int total;

  @override
  Widget build(BuildContext context) {
    final fraction = total > 0 ? amount / total : 0.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label),
              Text(
                AmountFormatter.format(amount),
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
