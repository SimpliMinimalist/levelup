import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Screens
import '../../features/store/store_page.dart';
import '../../features/orders/orders_page.dart';
import '../../features/profile/profile_page.dart';
import '../../features/settings/settings_page.dart';

// Navigation
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
      // Stateful Shell Route (Tabs with persistent state)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(navigationShell: navigationShell);
        },
        branches: [
          // BRANCH 1: STORE
          StatefulShellBranch(
            navigatorKey: _storeNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.store,
                pageBuilder: (context, state) => const NoTransitionPage(child: StorePage()),
              ),
            ],
          ),

          // BRANCH 2: ORDERS
          StatefulShellBranch(
            navigatorKey: _ordersNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.orders,
                pageBuilder: (context, state) => const NoTransitionPage(child: OrdersPage()),
              ),
            ],
          ),

          // BRANCH 3: PROFILE
          StatefulShellBranch(
            navigatorKey: _profileNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                name: AppRoutes.profile,
                pageBuilder: (context, state) => const NoTransitionPage(child: ProfilePage()),
                routes: [
                  // SUB-ROUTE: Settings (Pushes ON TOP of Profile)
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