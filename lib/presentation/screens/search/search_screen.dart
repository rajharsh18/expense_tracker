import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/entities/transaction_entity.dart';
import '../../providers/data_providers.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/transaction_tile.dart';

/// Global search screen with advanced filters.
class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _searchController = TextEditingController();
  String? _typeFilter;
  String? _paymentModeFilter;
  int? _accountFilter;
  bool _bookmarkedOnly = false;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _applyFilters() {
    ref.read(searchFilterProvider.notifier).state = SearchFilter(
      query: _searchController.text.isEmpty ? null : _searchController.text,
      type: _typeFilter,
      accountId: _accountFilter,
      paymentMode: _paymentModeFilter,
      startDate: _startDate,
      endDate: _endDate,
      bookmarkedOnly: _bookmarkedOnly ? true : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final resultsAsync = ref.watch(searchResultsProvider);
    final accountsAsync = ref.watch(accountsProvider);
    // Keep payment modes warm/reactive for the filter sheet without keeping
    // an unused local binding here.
    ref.watch(paymentModesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search amount, category, account, remark...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.tune),
                  onPressed: () => _showFilters(context),
                ),
              ),
              onSubmitted: (_) => _applyFilters(),
              onChanged: (_) => _applyFilters(),
            ),
          ),
          Expanded(
            child: resultsAsync.when(
              data: (results) {
                if (results.isEmpty) {
                  return const Center(child: Text('No results found'));
                }

                final accountMap =
                    accountsAsync.valueOrNull?.fold<Map<int, String>>({}, (
                      map,
                      a,
                    ) {
                      map[a.id!] = a.entryName;
                      return map;
                    }) ??
                    {};

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: results.length,
                  itemBuilder: (context, index) {
                    final tx = results[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: GlassCard(
                        padding: EdgeInsets.zero,
                        child: TransactionTile(
                          transaction: tx,
                          accountName: accountMap[tx.accountId],
                          onTap: () => context.push('/transactions/${tx.id}'),
                        ),
                      ),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showFilters(BuildContext context) async {
    final accountsAsync = ref.read(accountsProvider);
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
                'Advanced Filters',
                style: Theme.of(ctx).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String?>(
                initialValue: _typeFilter,
                decoration: const InputDecoration(labelText: 'Type'),
                items: const [
                  DropdownMenuItem(value: null, child: Text('All')),
                  DropdownMenuItem(value: 'income', child: Text('Income')),
                  DropdownMenuItem(value: 'expense', child: Text('Expense')),
                  DropdownMenuItem(value: 'transfer', child: Text('Transfer')),
                ],
                onChanged: (v) => setModalState(() => _typeFilter = v),
              ),
              const SizedBox(height: 12),
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
              payModesAsync.when(
                data: (modes) => DropdownButtonFormField<String?>(
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
                  onChanged: (v) => setModalState(() => _paymentModeFilter = v),
                ),
                loading: () => const SizedBox.shrink(),
                error: (_, _) => const SizedBox.shrink(),
              ),
              SwitchListTile(
                title: const Text('Bookmarked only'),
                value: _bookmarkedOnly,
                onChanged: (v) => setModalState(() => _bookmarkedOnly = v),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: ctx,
                          initialDate: _startDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (date != null) {
                          setModalState(() => _startDate = date);
                        }
                      },
                      child: Text(
                        _startDate != null
                            ? 'From: ${_startDate!.toString().split(' ').first}'
                            : 'Start Date',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: ctx,
                          initialDate: _endDate ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (date != null) {
                          setModalState(() => _endDate = date);
                        }
                      },
                      child: Text(
                        _endDate != null
                            ? 'To: ${_endDate!.toString().split(' ').first}'
                            : 'End Date',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () {
                  _applyFilters();
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
