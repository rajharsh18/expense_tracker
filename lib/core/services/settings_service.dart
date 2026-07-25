import 'package:shared_preferences/shared_preferences.dart';

import '../constants/app_constants.dart';

/// Keys for persisted user preferences.
class SettingsKeys {
  SettingsKeys._();

  static const String darkMode = 'dark_mode';
  static const String currency = 'currency';
  static const String currencySymbol = 'currency_symbol';
  static const String language = 'language';
  static const String dailyReminder = 'daily_reminder';
  static const String monthlyReminder = 'monthly_reminder';
  static const String budgetReminder = 'budget_reminder';
  static const String budgetLimit = 'budget_limit';
  static const String budgetAlertShownDate = 'budget_alert_shown_date';
  static const String onboardingComplete = 'onboarding_complete';
}

/// Manages user settings via SharedPreferences.
class SettingsService {
  SettingsService(this._prefs);

  final SharedPreferences _prefs;

  bool get isDarkMode => _prefs.getBool(SettingsKeys.darkMode) ?? false;

  Future<void> setDarkMode(bool value) =>
      _prefs.setBool(SettingsKeys.darkMode, value);

  String get currency =>
      _prefs.getString(SettingsKeys.currency) ?? 'INR';

  String get currencySymbol {
    final stored = _prefs.getString(SettingsKeys.currencySymbol);
    if (stored == null || stored == '₹') {
      return AppConstants.defaultCurrencySymbol;
    }
    return stored;
  }

  Future<void> setCurrency(String code, String symbol) async {
    await _prefs.setString(SettingsKeys.currency, code);
    await _prefs.setString(SettingsKeys.currencySymbol, symbol);
  }

  String get language => _prefs.getString(SettingsKeys.language) ?? 'en';

  Future<void> setLanguage(String value) =>
      _prefs.setString(SettingsKeys.language, value);

  bool get dailyReminder =>
      _prefs.getBool(SettingsKeys.dailyReminder) ?? false;

  Future<void> setDailyReminder(bool value) =>
      _prefs.setBool(SettingsKeys.dailyReminder, value);

  bool get monthlyReminder =>
      _prefs.getBool(SettingsKeys.monthlyReminder) ?? false;

  Future<void> setMonthlyReminder(bool value) =>
      _prefs.setBool(SettingsKeys.monthlyReminder, value);

  bool get budgetReminder =>
      _prefs.getBool(SettingsKeys.budgetReminder) ?? false;

  Future<void> setBudgetReminder(bool value) =>
      _prefs.setBool(SettingsKeys.budgetReminder, value);

  int get budgetLimit => _prefs.getInt(SettingsKeys.budgetLimit) ?? 0;

  Future<void> setBudgetLimit(int value) =>
      _prefs.setInt(SettingsKeys.budgetLimit, value);

  String? get budgetAlertShownDate =>
      _prefs.getString(SettingsKeys.budgetAlertShownDate);

  Future<void> setBudgetAlertShownDate(String date) =>
      _prefs.setString(SettingsKeys.budgetAlertShownDate, date);

  bool get isOnboardingComplete =>
      _prefs.getBool(SettingsKeys.onboardingComplete) ?? false;

  Future<void> setOnboardingComplete(bool value) =>
      _prefs.setBool(SettingsKeys.onboardingComplete, value);

  Future<void> resetAll() => _prefs.clear();
}
