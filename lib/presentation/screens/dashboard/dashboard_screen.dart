import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/amount_formatter.dart';
import '../../providers/data_providers.dart';
import '../../widgets/glass_card.dart';

/// Main dashboard screen with balance and summary.
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summaryAsync = ref.watch(dashboardSummaryProvider);
    final remindersAsync = ref.watch(remindersProvider);
    final theme = AppThemeExtension.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(dashboardSummaryProvider);
            ref.invalidate(remindersProvider);
          },
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                title: const Text('Dashboard'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () => context.push(AppRouter.search),
                  ),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    remindersAsync.when(
                      data: (reminders) {
                        if (reminders.isEmpty) {
                          return const SizedBox.shrink();
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Notifications',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 8),
                            GlassCard(
                              child: Column(
                                children: [
                                  for (final r in reminders)
                                    ListTile(
                                      leading: const Icon(Icons.notifications),
                                      title: Text(r.name),
                                      subtitle: Text('${r.date} at ${r.time}'),
                                      dense: true,
                                    ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      },
                      loading: () => const SizedBox.shrink(),
                      error: (_, _) => const SizedBox.shrink(),
                    ),
                    summaryAsync.when(
                      data: (summary) => _BalanceCard(summary: summary),
                      loading: () => const _LoadingCard(height: 140),
                      error: (e, _) => Text('Error: $e'),
                    ),
                    const SizedBox(height: 16),
                    summaryAsync.when(
                      data: (summary) => Row(
                        children: [
                          Expanded(
                            child: _StatCard(
                              label: "Today's Income",
                              amount: summary.todayIncome,
                              color: theme.incomeColor,
                              icon: Icons.trending_down,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _StatCard(
                              label: "Today's Expense",
                              amount: summary.todayExpense,
                              color: theme.expenseColor,
                              icon: Icons.trending_up,
                            ),
                          ),
                        ],
                      ),
                      loading: () => const SizedBox(height: 100),
                      error: (_, _) => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 16),
                    summaryAsync.when(
                      data: (summary) => GlassCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Monthly Summary',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _SummaryItem(
                                  label: 'Income',
                                  amount: summary.monthlyIncome,
                                  color: theme.incomeColor,
                                ),
                                _SummaryItem(
                                  label: 'Expense',
                                  amount: summary.monthlyExpense,
                                  color: theme.expenseColor,
                                ),
                                _SummaryItem(
                                  label: 'Net',
                                  amount:
                                      summary.monthlyIncome -
                                      summary.monthlyExpense,
                                  color: colorScheme.primary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      loading: () => const _LoadingCard(height: 100),
                      error: (_, _) => const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 16),
                    if (summaryAsync.valueOrNull?.budgetLimit != null &&
                        summaryAsync.valueOrNull!.budgetLimit > 0)
                      summaryAsync.when(
                        data: (summary) => _BudgetProgress(summary: summary),
                        loading: () => const SizedBox.shrink(),
                        error: (_, _) => const SizedBox.shrink(),
                      ),
                    const SizedBox(height: 16),
                    _QuickActions(),
                    const SizedBox(height: 100),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({required this.summary});

  final dynamic summary;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GlassCard(
      gradient: LinearGradient(
        colors: [
          colorScheme.primary,
          colorScheme.primary.withValues(alpha: 0.8),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Current Balance',
            style: TextStyle(
              color: colorScheme.onPrimary.withValues(alpha: 0.8),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AmountFormatter.format(summary.totalBalance),
            style: TextStyle(
              color: colorScheme.onPrimary,
              fontSize: 32,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.amount,
    required this.color,
    required this.icon,
  });

  final String label;
  final int amount;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(height: 8),
          Text(label, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 4),
          Text(
            AmountFormatter.format(amount),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: color,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.label,
    required this.amount,
    required this.color,
  });

  final String label;
  final int amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        Text(
          AmountFormatter.format(amount),
          style: TextStyle(fontWeight: FontWeight.w700, color: color),
        ),
      ],
    );
  }
}

class _BudgetProgress extends StatelessWidget {
  const _BudgetProgress({required this.summary});

  final dynamic summary;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeExtension.of(context);
    final utilization = summary.budgetLimit > 0
        ? summary.budgetSpent / summary.budgetLimit
        : 0.0;
    final progress = utilization.clamp(0.0, 1.0);
    final isOverBudget = summary.budgetSpent > summary.budgetLimit;
    final isNearLimit = !isOverBudget && utilization >= 0.9;
    final difference = (summary.budgetLimit - summary.budgetSpent).abs();

    final progressColor = isOverBudget
        ? theme.expenseColor
        : isNearLimit
        ? Colors.orange
        : theme.incomeColor;

    final statusText = isOverBudget
        ? '${AmountFormatter.format(difference)} exceeded'
        : '${AmountFormatter.format(difference)} remaining';

    return GlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Budget Progress',
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                '${AmountFormatter.format(summary.budgetSpent)} / ${AmountFormatter.format(summary.budgetLimit)}',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            statusText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: progressColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              backgroundColor: theme.expenseColor.withValues(alpha: 0.15),
              color: progressColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(
            label: 'Expense',
            icon: Icons.remove_circle_outline,
            color: AppThemeExtension.of(context).expenseColor,
            onTap: () =>
                context.push('${AppRouter.addTransaction}?type=expense'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _ActionButton(
            label: 'Income',
            icon: Icons.add_circle_outline,
            color: AppThemeExtension.of(context).incomeColor,
            onTap: () =>
                context.push('${AppRouter.addTransaction}?type=income'),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _ActionButton(
            label: 'Transfer',
            icon: Icons.swap_horiz,
            color: AppThemeExtension.of(context).transferColor,
            onTap: () =>
                context.push('${AppRouter.addTransaction}?type=transfer'),
          ),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              Icon(icon, color: color, size: 22),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}
