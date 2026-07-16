import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/app_providers.dart';
import '../../providers/data_providers.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/transaction_tile.dart';

/// Screen listing all transactions with type filter.
class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key});

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen> {
  String _filter = 'all';
  int? _accountFilter;
  String? _categoryFilter;
  String? _paymentModeFilter;

  bool get _hasAnyFilter =>
      _accountFilter != null ||
      _categoryFilter != null ||
      _paymentModeFilter != null;

  void _clearAdvancedFilters() {
    setState(() {
      _accountFilter = null;
      _categoryFilter = null;
      _paymentModeFilter = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactionsAsync = ref.watch(transactionsProvider);
    final accountsAsync = ref.watch(accountsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
        actions: [
          IconButton(
            icon: Badge(
              isLabelVisible: _hasAnyFilter,
              child: const Icon(Icons.filter_list),
            ),
            onPressed: () => _showFilters(context),
          ),
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
                _FilterChip(
                  label: 'All',
                  selected: _filter == 'all',
                  onSelected: () => setState(() => _filter = 'all'),
                ),
                _FilterChip(
                  label: 'Grains',
                  selected: _filter == 'grains',
                  onSelected: () => setState(() => _filter = 'grains'),
                ),
                _FilterChip(
                  label: 'Income',
                  selected: _filter == 'income',
                  onSelected: () => setState(() => _filter = 'income'),
                ),
                _FilterChip(
                  label: 'Expense',
                  selected: _filter == 'expense',
                  onSelected: () => setState(() => _filter = 'expense'),
                ),
                _FilterChip(
                  label: 'Transfer',
                  selected: _filter == 'transfer',
                  onSelected: () => setState(() => _filter = 'transfer'),
                ),
                _FilterChip(
                  label: 'Bookmarked',
                  selected: _filter == 'bookmarked',
                  onSelected: () => setState(() => _filter = 'bookmarked'),
                ),
              ],
            ),
          ),
          if (_hasAnyFilter)
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
                    onPressed: _clearAdvancedFilters,
                    child: const Text('Clear all'),
                  ),
                ],
              ),
            ),
          Expanded(
            child: transactionsAsync.when(
              data: (transactions) {
                final filtered = transactions.where((t) {
                  if (_filter == 'grains') {
                    if (!t.isGrain) return false;
                  } else if (_filter == 'all') {
                    if (t.isGrain) return false;
                  } else if (_filter == 'bookmarked') {
                    if (!t.isBookmark || t.isGrain) return false;
                  } else if (t.type != _filter || t.isGrain) {
                    return false;
                  }
                  if (_accountFilter != null && t.accountId != _accountFilter) {
                    return false;
                  }
                  if (_categoryFilter != null &&
                      t.category.trim().toLowerCase() !=
                          _categoryFilter!.trim().toLowerCase()) {
                    return false;
                  }
                  if (_paymentModeFilter != null &&
                      t.paymentMode.trim().toLowerCase() !=
                          _paymentModeFilter!.trim().toLowerCase()) {
                    return false;
                  }
                  return true;
                }).toList();

                if (filtered.isEmpty) {
                  return const Center(child: Text('No transactions found'));
                }

                final accountMap = accountsAsync.valueOrNull
                        ?.fold<Map<int, String>>({}, (map, a) {
                      map[a.id!] = a.entryName;
                      return map;
                    }) ??
                    {};

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final tx = filtered[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: GlassCard(
                        padding: EdgeInsets.zero,
                        child: TransactionTile(
                          transaction: tx,
                          accountName: accountMap[tx.accountId],
                          onTap: () =>
                              context.push('/transactions/${tx.id}'),
                          onBookmark: () async {
                            final repo = ref.read(
                              transactionRepositoryProvider,
                            );
                            await repo.toggleBookmark(tx.id!, !tx.isBookmark);
                          },
                        ),
                      ),
                    );
                  },
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

  Future<void> _showFilters(BuildContext context) async {
    final accountsAsync = ref.read(accountsProvider);
    final categoriesAsync = ref.read(categoriesProvider);
    final payModesAsync = ref.read(paymentModesProvider);

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
                  initialValue: _accountFilter,
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
                  onChanged: (v) => setModalState(() => _accountFilter = v),
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 12),
              categoriesAsync.when(
                data: (categories) {
                  if (categories.isEmpty) return const SizedBox.shrink();
                  return DropdownButtonFormField<String?>(
                    initialValue: _categoryFilter,
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
                    onChanged: (v) => setModalState(() => _categoryFilter = v),
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
                    initialValue: _paymentModeFilter,
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
                        setModalState(() => _paymentModeFilter = v),
                  );
                },
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  setState(() {});
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
