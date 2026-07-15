import 'package:intl/intl.dart';

import '../constants/app_constants.dart';

/// Formats CashBook integer amounts (stored in smallest currency unit).
class AmountFormatter {
  AmountFormatter._();

  static final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: AppConstants.defaultLocale,
    symbol: AppConstants.defaultCurrencySymbol,
    decimalDigits: 2,
  );

  static final NumberFormat _compactFormat = NumberFormat.compactCurrency(
    locale: AppConstants.defaultLocale,
    symbol: AppConstants.defaultCurrencySymbol,
    decimalDigits: 0,
  );

  /// CashBook stores amounts as integer paise (amount * 100).
  static double toDisplayAmount(int amount) => amount / 100.0;

  static int toStorageAmount(double amount) => (amount * 100).round();

  static String format(int amount, {bool compact = false}) {
    final value = toDisplayAmount(amount);
    if (compact && value.abs() >= 100000) {
      return _compactFormat.format(value);
    }
    return _currencyFormat.format(value);
  }

  static String formatSigned(int amount, {bool isExpense = false}) {
    final prefix = isExpense ? '-' : '+';
    return '$prefix${format(amount.abs())}';
  }
}
