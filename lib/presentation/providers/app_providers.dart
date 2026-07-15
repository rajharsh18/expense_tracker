import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/services/settings_service.dart';
import '../../data/database/database_holder.dart';
import '../../data/repositories/account_repository.dart';
import '../../data/repositories/category_repository.dart';
import '../../data/repositories/report_repository.dart';
import '../../data/repositories/transaction_repository.dart';
import '../../data/services/backup_service.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('SharedPreferences must be overridden in main()');
});

final settingsServiceProvider = Provider<SettingsService>((ref) {
  return SettingsService(ref.watch(sharedPreferencesProvider));
});


final transactionRepositoryProvider = Provider<TransactionRepository>((ref) {
  return TransactionRepository(ref.watch(databaseProvider));
});

final accountRepositoryProvider = Provider<AccountRepository>((ref) {
  return AccountRepository(ref.watch(databaseProvider));
});

final categoryRepositoryProvider = Provider<CategoryRepository>((ref) {
  return CategoryRepository(ref.watch(databaseProvider));
});

final paymentModeRepositoryProvider = Provider<PaymentModeRepository>((ref) {
  return PaymentModeRepository(ref.watch(databaseProvider));
});

final reminderRepositoryProvider = Provider<ReminderRepository>((ref) {
  return ReminderRepository(ref.watch(databaseProvider));
});

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  return ReportRepository(
    ref.watch(databaseProvider),
    ref.watch(accountRepositoryProvider),
  );
});

final backupServiceProvider = Provider<BackupService>((ref) {
  return BackupService(ref.watch(databaseProvider));
});

final darkModeProvider =
    StateNotifierProvider<DarkModeNotifier, bool>((ref) {
  return DarkModeNotifier(ref.watch(settingsServiceProvider));
});

class DarkModeNotifier extends StateNotifier<bool> {
  DarkModeNotifier(this._settings) : super(_settings.isDarkMode);

  final SettingsService _settings;

  Future<void> toggle() async {
    state = !state;
    await _settings.setDarkMode(state);
  }

  Future<void> set(bool value) async {
    state = value;
    await _settings.setDarkMode(value);
  }
}

final currencySymbolProvider = Provider<String>((ref) {
  return ref.watch(settingsServiceProvider).currencySymbol;
});

final budgetLimitProvider =
    StateNotifierProvider<BudgetLimitNotifier, int>((ref) {
  return BudgetLimitNotifier(ref.watch(settingsServiceProvider));
});

class BudgetLimitNotifier extends StateNotifier<int> {
  BudgetLimitNotifier(this._settings) : super(_settings.budgetLimit);

  final SettingsService _settings;

  Future<void> set(int value) async {
    state = value;
    await _settings.setBudgetLimit(value);
  }
}

void refreshDatabase(WidgetRef ref) {
  ref.read(databaseRefreshProvider.notifier).state++;
}

Future<void> reopenDatabase(WidgetRef ref) async {
  await ref.read(databaseHolderProvider).reopen();
  refreshDatabase(ref);
}
