import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/models/export_options.dart';
import '../../providers/data_providers.dart';

/// Bottom sheet for choosing PDF/Excel export filters.
class ExportOptionsSheet extends ConsumerStatefulWidget {
  const ExportOptionsSheet({super.key, required this.format});

  final ExportFormat format;

  @override
  ConsumerState<ExportOptionsSheet> createState() => _ExportOptionsSheetState();
}

class _ExportOptionsSheetState extends ConsumerState<ExportOptionsSheet> {
  ExportTransactionTypeFilter _transactionType =
      ExportTransactionTypeFilter.both;
  ExportRecordTypeFilter _recordType = ExportRecordTypeFilter.both;
  bool _allAccounts = true;
  bool _allDates = true;
  DateTime? _startDate;
  DateTime? _endDate;
  final Set<int> _selectedAccountIds = {};

  @override
  Widget build(BuildContext context) {
    final accountsAsync = ref.watch(accountsProvider);
    final formatLabel = widget.format == ExportFormat.pdf ? 'PDF' : 'Excel';

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Text(
            'Export as $formatLabel',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Choose what to include in your export.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Text(
            'Transaction type',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          SegmentedButton<ExportTransactionTypeFilter>(
            segments: ExportTransactionTypeFilter.values
                .map(
                  (value) => ButtonSegment(
                    value: value,
                    label: Text(value.label),
                  ),
                )
                .toList(),
            selected: {_transactionType},
            onSelectionChanged: (selection) {
              setState(() => _transactionType = selection.first);
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Record type',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          SegmentedButton<ExportRecordTypeFilter>(
            segments: ExportRecordTypeFilter.values
                .map(
                  (value) => ButtonSegment(
                    value: value,
                    label: Text(value.label),
                  ),
                )
                .toList(),
            selected: {_recordType},
            onSelectionChanged: (selection) {
              setState(() => _recordType = selection.first);
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Date range',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('All dates'),
            value: _allDates,
            onChanged: (value) {
              setState(() {
                _allDates = value;
                if (value) {
                  _startDate = null;
                  _endDate = null;
                }
              });
            },
          ),
          if (!_allDates) ...[
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Start date'),
              subtitle: Text(
                _startDate != null
                    ? _formatDate(_startDate!)
                    : 'Not set',
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _startDate ?? _endDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  setState(() => _startDate = date);
                }
              },
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('End date'),
              subtitle: Text(
                _endDate != null ? _formatDate(_endDate!) : 'Not set',
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: _endDate ?? _startDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (date != null) {
                  setState(() => _endDate = date);
                }
              },
            ),
          ],
          const SizedBox(height: 16),
          Text(
            'Accounts',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: const Text('All accounts'),
            value: _allAccounts,
            onChanged: (value) {
              setState(() {
                _allAccounts = value;
                if (value) _selectedAccountIds.clear();
              });
            },
          ),
          if (!_allAccounts)
            accountsAsync.when(
              data: (accounts) {
                if (accounts.isEmpty) {
                  return const Text('No accounts available.');
                }
                return ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 180),
                  child: ListView(
                    shrinkWrap: true,
                    children: accounts.map((account) {
                      final id = account.id;
                      if (id == null) return const SizedBox.shrink();
                      return CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(account.entryName),
                        value: _selectedAccountIds.contains(id),
                        onChanged: (checked) {
                          setState(() {
                            if (checked == true) {
                              _selectedAccountIds.add(id);
                            } else {
                              _selectedAccountIds.remove(id);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                );
              },
              loading: () => const LinearProgressIndicator(),
              error: (_, _) => const Text('Failed to load accounts'),
            ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: () {
              if (!_allAccounts && _selectedAccountIds.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Select at least one account to export.'),
                  ),
                );
                return;
              }

              if (!_allDates && _startDate == null && _endDate == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Select a start date, end date, or both.'),
                  ),
                );
                return;
              }

              if (_startDate != null &&
                  _endDate != null &&
                  _startDate!.isAfter(_endDate!)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Start date must be before end date.'),
                  ),
                );
                return;
              }

              Navigator.pop(
                context,
                ExportOptions(
                  transactionType: _transactionType,
                  recordType: _recordType,
                  allAccounts: _allAccounts,
                  accountIds: Set<int>.from(_selectedAccountIds),
                  allDates: _allDates,
                  startDate: _startDate,
                  endDate: _endDate,
                ),
              );
            },
            child: Text('Export $formatLabel'),
          ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) =>
      '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
}

/// Dialog for choosing ZIP backup vs PDF/Excel export.
Future<ExportFormat?> showExportFormatDialog(BuildContext context) {
  return showDialog<ExportFormat>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Export Data'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('What would you like to export?'),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.folder_zip),
            title: const Text('Full backup (ZIP)'),
            subtitle: const Text('Export all app data as a ZIP backup'),
            onTap: () => Navigator.pop(ctx, ExportFormat.zip),
          ),
          ListTile(
            leading: const Icon(Icons.picture_as_pdf_outlined),
            title: const Text('PDF report'),
            subtitle: const Text('Filtered transactions as a PDF file'),
            onTap: () => Navigator.pop(ctx, ExportFormat.pdf),
          ),
          ListTile(
            leading: const Icon(Icons.table_chart_outlined),
            title: const Text('Excel report'),
            subtitle: const Text('Filtered transactions as a CSV for Excel'),
            onTap: () => Navigator.pop(ctx, ExportFormat.excel),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: const Text('Cancel'),
        ),
      ],
    ),
  );
}

Future<ExportOptions?> showExportOptionsSheet(
  BuildContext context,
  ExportFormat format,
) {
  return showModalBottomSheet<ExportOptions>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => ExportOptionsSheet(format: format),
  );
}
