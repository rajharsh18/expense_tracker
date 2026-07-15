import 'package:go_router/go_router.dart';

import '../../presentation/screens/accounts/accounts_screen.dart';
import '../../presentation/screens/categories/categories_screen.dart';
import '../../presentation/screens/dashboard/dashboard_screen.dart';
import '../../presentation/screens/reports/reports_screen.dart';
import '../../presentation/screens/search/search_screen.dart';
import '../../presentation/screens/settings/settings_screen.dart';
import '../../presentation/screens/shell/main_shell.dart';
import '../../presentation/screens/transactions/add_transaction_screen.dart';
import '../../presentation/screens/transactions/transaction_detail_screen.dart';
import '../../presentation/screens/transactions/transactions_screen.dart';

/// Application routing configuration using go_router.
class AppRouter {
  AppRouter._();

  static const String dashboard = '/';
  static const String transactions = '/transactions';
  static const String addTransaction = '/transactions/add';
  static const String transactionDetail = '/transactions/:id';
  static const String accounts = '/accounts';
  static const String categories = '/categories';
  static const String reports = '/reports';
  static const String search = '/search';
  static const String settings = '/settings';

  static final GoRouter router = GoRouter(
    initialLocation: dashboard,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainShell(child: child),
        routes: [
          GoRoute(
            path: dashboard,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: DashboardScreen()),
          ),
          GoRoute(
            path: transactions,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: TransactionsScreen()),
          ),
          GoRoute(
            path: reports,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: ReportsScreen()),
          ),
          GoRoute(
            path: settings,
            pageBuilder: (context, state) =>
                const NoTransitionPage(child: SettingsScreen()),
          ),
        ],
      ),
      GoRoute(
        path: addTransaction,
        builder: (context, state) {
          final type = state.uri.queryParameters['type'] ?? 'expense';
          return AddTransactionScreen(initialType: type);
        },
      ),
      GoRoute(
        path: '/transactions/:id',
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return TransactionDetailScreen(transactionId: id);
        },
      ),
      GoRoute(
        path: accounts,
        builder: (context, state) => const AccountsScreen(),
      ),
      GoRoute(
        path: categories,
        builder: (context, state) => const CategoriesScreen(),
      ),
      GoRoute(path: search, builder: (context, state) => const SearchScreen()),
    ],
  );
}
