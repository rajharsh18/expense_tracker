import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/amount_formatter.dart';
import '../../../core/utils/weight_formatter.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../providers/app_providers.dart';
import '../../providers/data_providers.dart';
import '../../models/transaction_filters.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/scaled_amount_text.dart';
import '../../widgets/transaction_tile.dart';

/// Screen listing all transactions with type filter.
class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key});

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  bool _matchesFilters(TransactionEntity t, TransactionFilters filters) {
    if (t.isTransfer) return false;
    if (filters.typeFilter == 'grains') {
      if (!t.isGrain) return false;
    } else if (filters.typeFilter == 'all') {
      if (t.isGrain) return false;
    } else if (filters.typeFilter == 'bookmarked') {
      if (!t.isBookmark || t.isGrain) return false;
    } else if (t.type != filters.typeFilter || t.isGrain) {
      return false;
    }
    if (filters.accountId != null && t.accountId != filters.accountId) {
      return false;
    }
    if (filters.category != null &&
        t.category.trim().toLowerCase() !=
            filters.category!.trim().toLowerCase()) {
      return false;
    }
    if (filters.paymentMode != null &&
        t.paymentMode.trim().toLowerCase() !=
            filters.paymentMode!.trim().toLowerCase()) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final filters = ref.watch(transactionFiltersProvider);
    final filtersNotifier = ref.read(transactionFiltersProvider.notifier);

    final transactionsAsync = ref.watch(transactionsProvider);
    final accountsAsync = ref.watch(accountsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.push('/search'),
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: IconButton(
                    icon: Badge(
                      isLabelVisible: filters.hasAdvancedFilter,
                      child: const Icon(Icons.filter_list),
                    ),
                    tooltip: 'Filter',
                    onPressed: () => _showFilters(context, filters),
                  ),
                ),
                _FilterChip(
                  label: 'All',
                  selected: filters.typeFilter == 'all',
                  onSelected: () => filtersNotifier.setTypeFilter('all'),
                ),
                _FilterChip(
                  label: 'Grains',
                  selected: filters.typeFilter == 'grains',
                  onSelected: () => filtersNotifier.setTypeFilter('grains'),
                ),
                _FilterChip(
                  label: 'Income',
                  selected: filters.typeFilter == 'income',
                  onSelected: () => filtersNotifier.setTypeFilter('income'),
                ),
                _FilterChip(
                  label: 'Expense',
                  selected: filters.typeFilter == 'expense',
                  onSelected: () => filtersNotifier.setTypeFilter('expense'),
                ),
                _FilterChip(
                  label: 'Bookmarked',
                  selected: filters.typeFilter == 'bookmarked',
                  onSelected: () =>
                      filtersNotifier.setTypeFilter('bookmarked'),
                ),
              ],
            ),
          ),
          if (filters.hasAdvancedFilter)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Filters active',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  TextButton(
                    onPressed: filtersNotifier.clearAdvanced,
                    child: const Text('Clear all'),
                  ),
                ],
              ),
            ),
          Expanded(
            child: transactionsAsync.when(
              data: (transactions) {
                final filtered =
                    transactions.where((t) => _matchesFilters(t, filters)).toList();
                final isGrainSummary = filters.typeFilter == 'grains';
                final totalIncome = isGrainSummary
                    ? filtered
                        .where((t) => t.isGrainIn)
                        .fold<int>(0, (sum, t) => sum + t.amount)
                    : filtered
                        .where((t) => t.isIncome)
                        .fold<int>(0, (sum, t) => sum + t.amount);
                final totalExpense = isGrainSummary
                    ? filtered
                        .where((t) => t.isGrainOut)
                        .fold<int>(0, (sum, t) => sum + t.amount)
                    : filtered
                        .where((t) => t.isExpense)
                        .fold<int>(0, (sum, t) => sum + t.amount);
                final net = totalIncome - totalExpense;

                final accountMap = accountsAsync.valueOrNull
                        ?.fold<Map<int, String>>({}, (map, a) {
                      map[a.id!] = a.entryName;
                      return map;
                    }) ??
                    {};

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                      child: _TransactionSummary(
                        income: totalIncome,
                        expense: totalExpense,
                        net: net,
                        isGrainMode: isGrainSummary,
                      ),
                    ),
                    Expanded(
                      child: filtered.isEmpty
                          ? const Center(
                              child: Text('No transactions found'),
                            )
                          : ListView.builder(
                              padding: const EdgeInsets.fromLTRB(12, 0, 12, 6),
                              itemCount: filtered.length,
                              itemBuilder: (context, index) {
                                final tx = filtered[index];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 4),
                                  child: GlassCard(
                                    padding: EdgeInsets.zero,
                                    child: TransactionTile(
                                      transaction: tx,
                                      accountName: accountMap[tx.accountId],
                                      onTap: () => context.push(
                                        '/transactions/${tx.id}',
                                      ),
                                      onBookmark: () async {
                                        final repo = ref.read(
                                          transactionRepositoryProvider,
                                        );
                                        await repo.toggleBookmark(
                                          tx.id!,
                                          !tx.isBookmark,
                                        );
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showFilters(
    BuildContext context,
    TransactionFilters filters,
  ) async {
    final accountsAsync = ref.read(accountsProvider);
    final categoriesAsync = ref.read(categoriesProvider);
    final payModesAsync = ref.read(paymentModesProvider);
    final filtersNotifier = ref.read(transactionFiltersProvider.notifier);

    int? accountFilter = filters.accountId;
    String? categoryFilter = filters.category;
    String? paymentModeFilter = filters.paymentMode;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setModalState) => Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(ctx).viewInsets.bottom,
            left: 16,
            right: 16,
            top: 16,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Filter Transactions',
                style: Theme.of(ctx).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              accountsAsync.when(
                data: (accounts) => DropdownButtonFormField<int?>(
                  initialValue: accountFilter,
                  decoration: const InputDecoration(labelText: 'Account'),
                  items: [
                    const DropdownMenuItem(value: null, child: Text('All')),
                    ...accounts.map(
                      (a) => DropdownMenuItem(
                        value: a.id,
                        child: Text(a.entryName),
                      ),
                    ),
                  ],
                  onChanged: (v) => setModalState(() => accountFilter = v),
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 12),
              categoriesAsync.when(
                data: (categories) {
                  if (categories.isEmpty) return const SizedBox.shrink();
                  return DropdownButtonFormField<String?>(
                    initialValue: categoryFilter,
                    decoration: const InputDecoration(labelText: 'Category'),
                    items: [
                      const DropdownMenuItem(value: null, child: Text('All')),
                      ...categories.map(
                        (c) => DropdownMenuItem(
                          value: c.categoryName,
                          child: Text(c.categoryName),
                        ),
                      ),
                    ],
                    onChanged: (v) => setModalState(() => categoryFilter = v),
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 12),
              payModesAsync.when(
                data: (modes) {
                  if (modes.isEmpty) return const SizedBox.shrink();
                  return DropdownButtonFormField<String?>(
                    initialValue: paymentModeFilter,
                    decoration: const InputDecoration(labelText: 'Payment Mode'),
                    items: [
                      const DropdownMenuItem(value: null, child: Text('All')),
                      ...modes.map(
                        (m) => DropdownMenuItem(
                          value: m.payModeName,
                          child: Text(m.payModeName),
                        ),
                      ),
                    ],
                    onChanged: (v) =>
                        setModalState(() => paymentModeFilter = v),
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  filtersNotifier.applyAdvanced(
                    accountId: accountFilter,
                    category: categoryFilter,
                    paymentMode: paymentModeFilter,
                  );
                  Navigator.pop(ctx);
                },
                child: const Text('Apply Filters'),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _TransactionSummary extends StatelessWidget {
  const _TransactionSummary({
    required this.income,
    required this.expense,
    required this.net,
    required this.isGrainMode,
  });

  final int income;
  final int expense;
  final int net;
  final bool isGrainMode;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeExtension.of(context);
    final incomeLabel = isGrainMode ? 'IN' : 'Income';
    final expenseLabel = isGrainMode ? 'OUT' : 'Expense';
    final netColor = theme.netColor(net);

    return GlassCard(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: _SummaryItem(
              label: incomeLabel,
              amount: income,
              color: theme.incomeColor,
              isGrainMode: isGrainMode,
            ),
          ),
          Expanded(
            child: _SummaryItem(
              label: expenseLabel,
              amount: expense,
              color: theme.expenseColor,
              isGrainMode: isGrainMode,
            ),
          ),
          Expanded(
            child: _SummaryItem(
              label: 'Net',
              amount: net,
              color: netColor,
              isGrainMode: isGrainMode,
              signed: true,
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
    this.isGrainMode = false,
    this.signed = false,
  });

  final String label;
  final int amount;
  final Color color;
  final bool isGrainMode;
  final bool signed;

  String _formatAmount() {
    if (isGrainMode) {
      if (signed) {
        final prefix = amount < 0 ? '-' : amount > 0 ? '+' : '';
        return '$prefix${WeightFormatter.format(amount.abs())}';
      }
      return WeightFormatter.format(amount);
    }

    if (signed) {
      return AmountFormatter.formatSigned(
        amount.abs(),
        isExpense: amount < 0,
      );
    }
    return AmountFormatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        ScaledAmountText(
          _formatAmount(),
          style: TextStyle(fontWeight: FontWeight.w700, color: color),
        ),
      ],
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: selected,
        onSelected: (_) => onSelected(),
      ),
    );
  }
}
