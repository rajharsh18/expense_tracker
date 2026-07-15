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

  @override
  Widget build(BuildContext context) {
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
                _FilterChip(
                  label: 'All',
                  selected: _filter == 'all',
                  onSelected: () => setState(() => _filter = 'all'),
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
          Expanded(
            child: transactionsAsync.when(
              data: (transactions) {
                final filtered = transactions.where((t) {
                  if (_filter == 'all') return true;
                  if (_filter == 'bookmarked') return t.isBookmark;
                  return t.type == _filter;
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
