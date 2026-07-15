import 'package:flutter/material.dart';

import '../constants/app_constants.dart';

/// Material 3 theme configuration for the expense tracker.
class AppTheme {
  AppTheme._();

  static const Color _seedColor = Color(0xFF1B6B4A);

  static ThemeData lightTheme(String currencySymbol) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.light,
    );
    return _buildTheme(colorScheme, currencySymbol, Brightness.light);
  }

  static ThemeData darkTheme(String currencySymbol) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: _seedColor,
      brightness: Brightness.dark,
    );
    return _buildTheme(colorScheme, currencySymbol, Brightness.dark);
  }

  static ThemeData _buildTheme(
    ColorScheme colorScheme,
    String currencySymbol,
    Brightness brightness,
  ) {
    final textTheme = ThemeData(brightness: brightness).textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
      fontFamily: 'Roboto',
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: brightness == Brightness.light
          ? const Color(0xFFF5F7FA)
          : const Color(0xFF0F1419),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
        ),
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: brightness == Brightness.light
            ? Colors.white.withValues(alpha: 0.85)
            : colorScheme.surfaceContainerHigh.withValues(alpha: 0.6),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        elevation: 0,
        height: 72,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        indicatorColor: colorScheme.primaryContainer,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant.withValues(alpha: 0.4),
      ),
      extensions: [
        AppThemeExtension(
          incomeColor: const Color(0xFF2E7D32),
          expenseColor: const Color(0xFFC62828),
          transferColor: const Color(0xFF1565C0),
          glassColor: brightness == Brightness.light
              ? Colors.white.withValues(alpha: 0.7)
              : colorScheme.surface.withValues(alpha: 0.5),
          currencySymbol: currencySymbol,
        ),
      ],
    );
  }
}

/// Custom theme extension for finance-specific colors.
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.incomeColor,
    required this.expenseColor,
    required this.transferColor,
    required this.glassColor,
    required this.currencySymbol,
  });

  final Color incomeColor;
  final Color expenseColor;
  final Color transferColor;
  final Color glassColor;
  final String currencySymbol;

  @override
  AppThemeExtension copyWith({
    Color? incomeColor,
    Color? expenseColor,
    Color? transferColor,
    Color? glassColor,
    String? currencySymbol,
  }) {
    return AppThemeExtension(
      incomeColor: incomeColor ?? this.incomeColor,
      expenseColor: expenseColor ?? this.expenseColor,
      transferColor: transferColor ?? this.transferColor,
      glassColor: glassColor ?? this.glassColor,
      currencySymbol: currencySymbol ?? this.currencySymbol,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      incomeColor: Color.lerp(incomeColor, other.incomeColor, t)!,
      expenseColor: Color.lerp(expenseColor, other.expenseColor, t)!,
      transferColor: Color.lerp(transferColor, other.transferColor, t)!,
      glassColor: Color.lerp(glassColor, other.glassColor, t)!,
      currencySymbol: t < 0.5 ? currencySymbol : other.currencySymbol,
    );
  }

  static AppThemeExtension of(BuildContext context) {
    return Theme.of(context).extension<AppThemeExtension>() ??
        const AppThemeExtension(
          incomeColor: Color(0xFF2E7D32),
          expenseColor: Color(0xFFC62828),
          transferColor: Color(0xFF1565C0),
          glassColor: Colors.white70,
          currencySymbol: AppConstants.defaultCurrencySymbol,
        );
  }
}
