import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import '../router/app_router.dart';

/// Sends the app to the background on Android, or exits on other platforms.
class AppMinimize {
  AppMinimize._();

  static const _channel = MethodChannel('app.lifecycle');

  static Future<void> moveToBackground() async {
    if (Platform.isAndroid) {
      await _channel.invokeMethod<void>('moveToBackground');
      return;
    }
    SystemNavigator.pop();
  }
}

void navigateToHome(BuildContext context) {
  final router = GoRouter.of(context);
  if (router.state.uri.path == AppRouter.dashboard) return;
  router.go(AppRouter.dashboard);
}

Future<void> handleAppBack(BuildContext context) async {
  final location = GoRouter.of(context).state.uri.path;
  if (location == AppRouter.dashboard) {
    await AppMinimize.moveToBackground();
    return;
  }
  navigateToHome(context);
}

/// Intercepts the system back button for home-first navigation.
class BackNavigationHandler extends StatelessWidget {
  const BackNavigationHandler({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        handleAppBack(context);
      },
      child: child,
    );
  }
}

/// App bar for full-screen routes that should return to home.
class AppPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppPageAppBar({
    super.key,
    required this.title,
    this.actions,
    this.bottom,
  });

  final Widget title;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;

  @override
  Size get preferredSize {
    final bottomHeight = bottom?.preferredSize.height ?? 0;
    return Size.fromHeight(kToolbarHeight + bottomHeight);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => navigateToHome(context),
      ),
      automaticallyImplyLeading: false,
      title: title,
      actions: actions,
      bottom: bottom,
    );
  }
}
