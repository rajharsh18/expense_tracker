import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/navigation/back_navigation.dart';
import '../../../core/utils/amount_formatter.dart';
import '../../../core/utils/date_utils.dart';
import '../../../domain/entities/transaction_entity.dart';
import '../../providers/app_providers.dart';
import '../../providers/data_providers.dart';
import '../../widgets/glass_card.dart';
import '../../widgets/scaled_amount_text.dart';

/// Screen for managing accounts/ledgers.
class AccountsScreen extends ConsumerWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsAsync = ref.watch(accountsProvider);
    final balancesAsync = ref.watch(accountBalancesProvider);

    return Scaffold(
      appBar: AppPageAppBar(
        title: const Text('Accounts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _showAccountDialog(context, ref),
          ),
        ],
      ),
      body: accountsAsync.when(
        data: (accounts) {
          if (accounts.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('No accounts yet'),
                  const SizedBox(height: 16),
                  FilledButton.icon(
                    onPressed: () => _showAccountDialog(context, ref),
                    icon: const Icon(Icons.add),
                    label: const Text('Add Account'),
                  ),
                ],
              ),
            );
          }

          final balances = balancesAsync.valueOrNull ?? {};

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: accounts.length,
            itemBuilder: (context, index) {
              final account = accounts[index];
              final balance = balances[account.id] ?? 0;

              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: GlassCard(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(account.entryName[0].toUpperCase()),
                    ),
                    title: Text(
                      account.entryName,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(account.dateTime),
                    trailing: ScaledAmountText(
                      AmountFormatter.format(balance),
                      alignment: Alignment.centerRight,
                      maxWidthFraction: 0.35,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: balance >= 0
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.error,
                      ),
                    ),
                    onTap: () => _showAccountDialog(
                      context,
                      ref,
                      account: account,
                    ),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Future<void> _showAccountDialog(
    BuildContext context,
    WidgetRef ref, {
    AccountEntity? account,
  }) async {
    final nameController =
        TextEditingController(text: account?.entryName ?? '');
    final isEdit = account != null;

    final result = await showDialog<dynamic>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(isEdit ? 'Edit Account' : 'Add Account'),
        content: TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Account Name'),
          autofocus: true,
        ),
        actions: [
          if (isEdit)
            TextButton(
              onPressed: () => Navigator.pop(ctx, 'delete'),
              child: Text(
                'Delete',
                style: TextStyle(
                  color: Theme.of(ctx).colorScheme.error,
                ),
              ),
            ),
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Save'),
          ),
        ],
      ),
    );

    if (result == 'delete' && isEdit) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Delete Account'),
          content: Text(
            'Are you sure you want to delete "${account.entryName}"? '
            'This cannot be undone.',
          ),
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
        await ref.read(accountRepositoryProvider).delete(account.id!);
        refreshDatabase(ref);
      }
    } else if (result == true && nameController.text.isNotEmpty) {
      final repo = ref.read(accountRepositoryProvider);
      if (isEdit) {
        await repo.update(
          AccountEntity(
            id: account.id,
            entryName: nameController.text,
            dateTime: account.dateTime,
          ),
        );
      } else {
        await repo.insert(
          AccountEntity(
            entryName: nameController.text,
            dateTime: CashBookDateUtils.formatDateTime(DateTime.now()),
          ),
        );
      }
      refreshDatabase(ref);
    }
    nameController.dispose();
  }
}
