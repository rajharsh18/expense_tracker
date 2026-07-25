import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/app_router.dart';
import '../../models/transaction_filters.dart';
import '../../providers/data_providers.dart';
import '../dashboard/dashboard_screen.dart';
import '../reports/reports_screen.dart';
import '../settings/settings_screen.dart';
import '../transactions/transactions_screen.dart';

/// Main scaffold with bottom navigation bar and center add action.
class MainShell extends ConsumerStatefulWidget {
  const MainShell({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<MainShell> createState() => _MainShellState();
}

class _MainShellState extends ConsumerState<MainShell>
    with WidgetsBindingObserver {
  static final _routes = [
    AppRouter.dashboard,
    AppRouter.transactions,
    AppRouter.reports,
    AppRouter.settings,
  ];

  late final PageController _pageController;
  int _currentIndex = 0;
  bool _pageControllerReady = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_pageControllerReady) {
      final index = _indexFromRoute(context);
      _currentIndex = index;
      _pageController = PageController(initialPage: index);
      _pageControllerReady = true;
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (_pageControllerReady) {
      _pageController.dispose();
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      ref.read(transactionFiltersProvider.notifier).reset();
    }
  }

  int _indexFromRoute(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final index = _routes.indexWhere((r) => location == r);
    return index < 0 ? 0 : index;
  }

  void _onPageChanged(int index) {
    if (index == _currentIndex) return;
    setState(() => _currentIndex = index);
    context.go(_routes[index]);
  }

  void _onTap(int index) {
    if (index == _currentIndex) return;
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int?>(shellTabRequestProvider, (previous, next) {
      if (next == null || next == _currentIndex) return;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_pageControllerReady || !_pageController.hasClients) {
          return;
        }
        _pageController.jumpToPage(next);
        setState(() => _currentIndex = next);
        context.go(_routes[next]);
        ref.read(shellTabRequestProvider.notifier).state = null;
      });
    });

    final routeIndex = _indexFromRoute(context);
    if (routeIndex != _currentIndex && _pageControllerReady) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || !_pageController.hasClients) return;
        if (_pageController.page?.round() != routeIndex) {
          _pageController.jumpToPage(routeIndex);
          setState(() => _currentIndex = routeIndex);
        }
      });
    }

    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: const [
          DashboardScreen(),
          TransactionsScreen(),
          ReportsScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 8),
          child: Material(
            elevation: 2,
            shadowColor: Colors.black26,
            borderRadius: BorderRadius.circular(20),
            color: colorScheme.surfaceContainerHigh,
            child: SizedBox(
              height: 68,
              child: Row(
                children: [
                  Expanded(
                    child: _NavItem(
                      icon: Icons.dashboard_outlined,
                      selectedIcon: Icons.dashboard,
                      label: 'Home',
                      selected: _currentIndex == 0,
                      onTap: () => _onTap(0),
                    ),
                  ),
                  Expanded(
                    child: _NavItem(
                      icon: Icons.receipt_long_outlined,
                      selectedIcon: Icons.receipt_long,
                      label: 'Transactions',
                      selected: _currentIndex == 1,
                      onTap: () => _onTap(1),
                    ),
                  ),
                  SizedBox(
                    width: 64,
                    child: Center(
                      child: Material(
                        elevation: 4,
                        shape: const CircleBorder(),
                        color: colorScheme.primary,
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () => context.push(AppRouter.addTransaction),
                          child: SizedBox(
                            width: 52,
                            height: 52,
                            child: Icon(
                              Icons.add,
                              color: colorScheme.onPrimary,
                              size: 28,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: _NavItem(
                      icon: Icons.bar_chart_outlined,
                      selectedIcon: Icons.bar_chart,
                      label: 'Reports',
                      selected: _currentIndex == 2,
                      onTap: () => _onTap(2),
                    ),
                  ),
                  Expanded(
                    child: _NavItem(
                      icon: Icons.settings_outlined,
                      selectedIcon: Icons.settings,
                      label: 'Settings',
                      selected: _currentIndex == 3,
                      onTap: () => _onTap(3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final color = selected ? colorScheme.primary : colorScheme.onSurfaceVariant;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(selected ? selectedIcon : icon, color: color, size: 22),
            const SizedBox(height: 2),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontSize: 11,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
