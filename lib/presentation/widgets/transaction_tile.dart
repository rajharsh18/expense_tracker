import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../core/utils/amount_formatter.dart';
import '../../domain/entities/transaction_entity.dart';

/// List tile for displaying a transaction.
class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.transaction,
    this.accountName,
    this.onTap,
    this.onBookmark,
  });

  final TransactionEntity transaction;
  final String? accountName;
  final VoidCallback? onTap;
  final VoidCallback? onBookmark;

  @override
  Widget build(BuildContext context) {
    final theme = AppThemeExtension.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    Color typeColor;
    IconData typeIcon;
    switch (transaction.type) {
      case 'income':
        typeColor = theme.incomeColor;
        typeIcon = Icons.arrow_downward_rounded;
      case 'expense':
        typeColor = theme.expenseColor;
        typeIcon = Icons.arrow_upward_rounded;
      case 'transfer':
        typeColor = theme.transferColor;
        typeIcon = Icons.swap_horiz_rounded;
      default:
        typeColor = colorScheme.primary;
        typeIcon = Icons.receipt;
    }

    final title = transaction.name.isNotEmpty
        ? transaction.name
        : transaction.category.isNotEmpty
        ? transaction.category
        : transaction.type.toUpperCase();

    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: CircleAvatar(
        backgroundColor: typeColor.withValues(alpha: 0.15),
        child: Icon(typeIcon, color: typeColor, size: 20),
      ),
      title: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        [
          transaction.date,
          ?accountName,
          if (transaction.paymentMode.isNotEmpty) transaction.paymentMode,
        ].join(' · '),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AmountFormatter.formatSigned(
              transaction.amount,
              isExpense: transaction.isExpense,
            ),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: typeColor,
              fontSize: 15,
            ),
          ),
          if (onBookmark != null) ...[
            const SizedBox(width: 4),
            IconButton(
              icon: Icon(
                transaction.isBookmark ? Icons.bookmark : Icons.bookmark_border,
                size: 20,
                color: transaction.isBookmark
                    ? colorScheme.primary
                    : colorScheme.outline,
              ),
              onPressed: onBookmark,
              visualDensity: VisualDensity.compact,
            ),
          ],
        ],
      ),
    );
  }
}
