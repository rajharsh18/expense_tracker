import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/navigation/back_navigation.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'presentation/providers/app_providers.dart';

/// Root application widget.
class ExpenseTrackerApp extends ConsumerWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(darkModeProvider);
    final currencySymbol = ref.watch(currencySymbolProvider);

    return MaterialApp.router(
      title: 'Apna CashBook Expense Tracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(currencySymbol),
      darkTheme: AppTheme.darkTheme(currencySymbol),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      routerConfig: AppRouter.router,
      builder: (context, child) {
        return BackNavigationHandler(
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
