import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/store/store_page.dart';
import '../../features/orders/orders_page.dart';
import '../../features/profile/profile_page.dart';
import '../../features/settings/settings_page.dart';
import 'app_routes.dart';
import 'main_wrapper.dart';

class AppRouter {
  // Private navigator keys to preserve state
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _storeNavigatorKey = GlobalKey<NavigatorState>();
  static final _ordersNavigatorKey = GlobalKey<NavigatorState>();
  static final _profileNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.store,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _storeNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.store,
                pageBuilder: (context, state) => const NoTransitionPage(child: StorePage()),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _ordersNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.orders,
                pageBuilder: (context, state) => const NoTransitionPage(child: OrdersPage()),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _profileNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                name: AppRoutes.profile,
                pageBuilder: (context, state) => const NoTransitionPage(child: ProfilePage()),
                routes: [
                  GoRoute(
                    path: AppRoutes.settings,
                    name: AppRoutes.settings,
                    builder: (context, state) => const SettingsPage(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );
}