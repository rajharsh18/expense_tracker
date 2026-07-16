import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_theme.dart';
import '../../../core/utils/amount_formatter.dart';
import '../../../core/utils/weight_formatter.dart';
import '../../providers/app_providers.dart';
import '../../providers/data_providers.dart';
import '../../widgets/glass_card.dart';
import 'add_transaction_screen.dart';

/// Screen showing transaction details and edit history.
class TransactionDetailScreen extends ConsumerWidget {
  const TransactionDetailScreen({super.key, required this.transactionId});

  final int transactionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final transactionsAsync = ref.watch(transactionsProvider);
    final accountsAsync = ref.watch(accountsProvider);
    final theme = AppThemeExtension.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Details'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              final tx = await ref
                  .read(transactionRepositoryProvider)
                  .getById(transactionId);
              if (tx != null && context.mounted) {
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AddTransactionScreen(
                      initialType: tx.type,
                      transaction: tx,
                    ),
                  ),
                );
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () => _confirmDelete(context, ref),
          ),
        ],
      ),
      body: transactionsAsync.when(
        data: (transactions) {
          final matches =
              transactions.where((t) => t.id == transactionId).toList();
          if (matches.isEmpty) {
            return const Center(child: Text('Transaction not found'));
          }
          final tx = matches.first;

          final accountMap = accountsAsync.valueOrNull
                  ?.fold<Map<int, String>>({}, (map, a) {
                map[a.id!] = a.entryName;
                return map;
              }) ??
              {};

          Color typeColor;
          switch (tx.type) {
            case 'income':
              typeColor = theme.incomeColor;
            case 'expense':
              typeColor = theme.expenseColor;
            case 'transfer':
              typeColor = theme.transferColor;
            case 'grain':
            case 'grain_in':
              typeColor = const Color(0xFF2E7D32);
            case 'grain_out':
              typeColor = const Color(0xFF8D6E63);
            default:
              typeColor = Theme.of(context).colorScheme.primary;
          }

          List<String> images = [];
          try {
            final decoded = jsonDecode(tx.imageUris);
            if (decoded is List) {
              images = decoded.cast<String>();
            }
          } catch (_) {}

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              GlassCard(
                child: Column(
                  children: [
                    Text(
                      tx.isGrain
                          ? '${tx.isGrainOut ? '-' : '+'}${WeightFormatter.format(tx.amount)}'
                          : AmountFormatter.formatSigned(
                              tx.amount,
                              isExpense: tx.isExpense,
                            ),
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        color: typeColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      tx.name.isNotEmpty ? tx.name : tx.type.toUpperCase(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _DetailRow('Type', tx.type.toUpperCase()),
              _DetailRow('Date', tx.date),
              _DetailRow('Time', tx.time),
              _DetailRow('Account', accountMap[tx.accountId] ?? 'Unknown'),
              if (tx.category.isNotEmpty)
                _DetailRow('Category', tx.category),
              if (tx.paymentMode.isNotEmpty)
                _DetailRow('Payment Mode', tx.paymentMode),
              if (tx.remark.isNotEmpty) _DetailRow('Remark', tx.remark),
              if (tx.fromAccount != null)
                _DetailRow('From', tx.fromAccount!),
              if (tx.toAccount != null) _DetailRow('To', tx.toAccount!),
              _DetailRow(
                'Last Edited',
                '${tx.lastEditedDate} ${tx.lastEditedTime}',
              ),
              if (images.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  'Attachments',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: [
                    for (final path in images)
                      Chip(label: Text(path.split('/').last)),
                  ],
                ),
              ],
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Transaction'),
        content: const Text('Are you sure you want to delete this transaction?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(transactionRepositoryProvider).delete(transactionId);
      refreshDatabase(ref);
      if (context.mounted) context.pop();
    }
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.outline,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
