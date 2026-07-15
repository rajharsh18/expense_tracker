import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/router/app_router.dart';
import '../../../data/models/backup_metadata.dart';
import '../../../data/database/app_database.dart';
import '../../../data/database/database_holder.dart';
import '../../providers/app_providers.dart';

/// Settings screen with backup, theme, and app configuration.
class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);
    final settings = ref.watch(settingsServiceProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          _SectionHeader(title: 'Appearance'),
          SwitchListTile(
            title: const Text('Dark Mode'),
            subtitle: const Text('Toggle dark theme'),
            value: isDark,
            onChanged: (v) => ref.read(darkModeProvider.notifier).set(v),
          ),
          ListTile(
            title: const Text('Currency'),
            subtitle: Text('${settings.currency} (${settings.currencySymbol})'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showCurrencyPicker(context, ref),
          ),
          ListTile(
            title: const Text('Language'),
            subtitle: Text(settings.language.toUpperCase()),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showLanguagePicker(context, ref),
          ),
          const Divider(),
          _SectionHeader(title: 'Budget'),
          ListTile(
            title: const Text('Monthly Budget'),
            subtitle: Text(
              settings.budgetLimit > 0
                  ? '${settings.currencySymbol}${(settings.budgetLimit / 100).toStringAsFixed(2)}'
                  : 'Not set',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _showBudgetDialog(context, ref),
          ),
          SwitchListTile(
            title: const Text('Budget Reminder'),
            value: settings.budgetReminder,
            onChanged: (v) => settings.setBudgetReminder(v),
          ),
          const Divider(),
          _SectionHeader(title: 'Reminders'),
          SwitchListTile(
            title: const Text('Daily Reminder'),
            value: settings.dailyReminder,
            onChanged: (v) => settings.setDailyReminder(v),
          ),
          SwitchListTile(
            title: const Text('Monthly Reminder'),
            value: settings.monthlyReminder,
            onChanged: (v) => settings.setMonthlyReminder(v),
          ),
          const Divider(),
          _SectionHeader(title: 'Backup & Restore'),
          ListTile(
            leading: const Icon(Icons.upload_file),
            title: const Text('Export Backup'),
            subtitle: const Text('Create CashBook-compatible ZIP'),
            onTap: () => _exportBackup(context, ref),
          ),
          ListTile(
            leading: const Icon(Icons.download),
            title: const Text('Import Backup'),
            subtitle: const Text('Restore from CashBook ZIP'),
            onTap: () => _importBackup(context, ref),
          ),
          ListTile(
            leading: const Icon(Icons.merge),
            title: const Text('Merge Backup'),
            subtitle: const Text('Import without replacing existing data'),
            onTap: () => _importBackup(context, ref, merge: true),
          ),
          const Divider(),
          _SectionHeader(title: 'Data Management'),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet_outlined),
            title: const Text('Manage Accounts'),
            onTap: () => context.push(AppRouter.accounts),
          ),
          ListTile(
            leading: const Icon(Icons.category_outlined),
            title: const Text('Manage Categories'),
            onTap: () => context.push(AppRouter.categories),
          ),
          const Divider(),
          _SectionHeader(title: 'About'),
          const ListTile(
            title: Text('About'),
            subtitle: Text('${AppConstants.appName} v1.0.0'),
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            onTap: () => _showPrivacyPolicy(context),
          ),
          ListTile(
            leading: Icon(
              Icons.delete_forever,
              color: Theme.of(context).colorScheme.error,
            ),
            title: Text(
              'Reset Application',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            onTap: () => _resetApp(context, ref),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Future<void> _exportBackup(BuildContext context, WidgetRef ref) async {
    final backupService = ref.read(backupServiceProvider);
    String? exportPath;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => _BackupProgressDialog(
        stream: backupService.exportBackup(),
        onComplete: (path) => exportPath = path,
      ),
    );

    if (exportPath != null && context.mounted) {
      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(exportPath!)],
          text: 'CashBook Backup',
        ),
      );
      await reopenDatabase(ref);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Backup exported successfully')),
        );
      }
    }
  }

  Future<void> _importBackup(
    BuildContext context,
    WidgetRef ref, {
    bool merge = false,
  }) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['zip'],
    );

    if (result == null || result.files.single.path == null) return;

    final backupService = ref.read(backupServiceProvider);
    var success = false;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => _BackupProgressDialog(
        stream: backupService.importBackup(
          result.files.single.path!,
          mode: merge ? BackupImportMode.merge : BackupImportMode.replace,
        ),
        onComplete: (_) => success = true,
      ),
    );

    if (success) {
      await reopenDatabase(ref);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              merge
                  ? 'Backup merged successfully'
                  : 'Backup restored successfully',
            ),
          ),
        );
      }
    }
  }

  Future<void> _showCurrencyPicker(BuildContext context, WidgetRef ref) async {
    const currencies = {'INR': '₹', 'USD': '\$', 'EUR': '€', 'GBP': '£'};

    await showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Select Currency'),
        children: currencies.entries
            .map(
              (e) => SimpleDialogOption(
                onPressed: () async {
                  await ref
                      .read(settingsServiceProvider)
                      .setCurrency(e.key, e.value);
                  if (ctx.mounted) Navigator.pop(ctx);
                },
                child: Text('${e.key} (${e.value})'),
              ),
            )
            .toList(),
      ),
    );
  }

  Future<void> _showLanguagePicker(BuildContext context, WidgetRef ref) async {
    const languages = {'en': 'English', 'hi': 'Hindi'};

    await showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: const Text('Select Language'),
        children: languages.entries
            .map(
              (e) => SimpleDialogOption(
                onPressed: () async {
                  await ref.read(settingsServiceProvider).setLanguage(e.key);
                  if (ctx.mounted) Navigator.pop(ctx);
                },
                child: Text(e.value),
              ),
            )
            .toList(),
      ),
    );
  }

  Future<void> _showBudgetDialog(BuildContext context, WidgetRef ref) async {
    final controller = TextEditingController(
      text: ref.read(budgetLimitProvider) > 0
          ? (ref.read(budgetLimitProvider) / 100).toString()
          : '',
    );

    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Monthly Budget'),
        content: TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          decoration: const InputDecoration(
            labelText: 'Budget Amount',
            prefixText: '₹ ',
          ),
        ),
        actions: [
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

    if (result == true) {
      final amount = double.tryParse(controller.text) ?? 0;
      await ref.read(budgetLimitProvider.notifier).set((amount * 100).round());
    }
    controller.dispose();
  }

  void _showPrivacyPolicy(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Privacy Policy'),
        content: const SingleChildScrollView(
          child: Text(
            'Your financial data is stored locally on your device. '
            'We do not collect, transmit, or share your personal financial '
            'information with any third parties. Backup files are created '
            'locally and shared only when you explicitly choose to export them.',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Future<void> _resetApp(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Reset Application'),
        content: const Text(
          'This will delete all local data and settings. This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Reset'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      final db = ref.read(databaseProvider);
      await db.close();

      final docsDir = await AppDatabase.getDocumentsDirectory();
      for (final name in [
        AppConstants.cashbookDbName,
        AppConstants.notebookDbName,
        AppConstants.notebookWalName,
        AppConstants.notebookShmName,
      ]) {
        final file = File('$docsDir/$name');
        if (await file.exists()) await file.delete();
      }

      await ref.read(settingsServiceProvider).resetAll();
      await ref.read(databaseHolderProvider).reopen();
      refreshDatabase(ref);

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Application reset successfully')),
        );
      }
    }
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _BackupProgressDialog extends StatefulWidget {
  const _BackupProgressDialog({required this.stream, required this.onComplete});

  final Stream<BackupProgress> stream;
  final void Function(String? path) onComplete;

  @override
  State<_BackupProgressDialog> createState() => _BackupProgressDialogState();
}

class _BackupProgressDialogState extends State<_BackupProgressDialog> {
  double _progress = 0;
  String _message = 'Starting...';
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    widget.stream.listen(
      (progress) {
        if (mounted) {
          setState(() {
            _progress = progress.progress;
            _message = progress.message ?? '';
            _hasError = progress.stage == BackupProgressStage.error;
          });

          if (progress.stage == BackupProgressStage.complete) {
            widget.onComplete(progress.message);
            Future.delayed(const Duration(milliseconds: 500), () {
              if (mounted) Navigator.pop(context);
            });
          }

          if (progress.stage == BackupProgressStage.error) {
            Future.delayed(const Duration(seconds: 2), () {
              if (mounted) Navigator.pop(context);
            });
          }
        }
      },
      onError: (e) {
        if (mounted) {
          setState(() {
            _hasError = true;
            _message = e.toString();
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_hasError ? 'Error' : 'Processing Backup'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!_hasError) LinearProgressIndicator(value: _progress),
          const SizedBox(height: 16),
          Text(_message, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
