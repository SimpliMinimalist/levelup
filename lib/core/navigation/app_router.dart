import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/home_page.dart';
import '../../features/batches/batches_page.dart';
import '../../features/store/store_page.dart';
import '../../features/chats/chats_page.dart';
import '../../features/profile/profile_page.dart';
import '../../features/settings/settings_page.dart';
import 'app_routes.dart';
import 'main_wrapper.dart';

class AppRouter {
  // Private navigator keys to preserve state
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _homeNavigatorKey = GlobalKey<NavigatorState>();
  static final _batchesNavigatorKey = GlobalKey<NavigatorState>();
  static final _storeNavigatorKey = GlobalKey<NavigatorState>();
  static final _chatsNavigatorKey = GlobalKey<NavigatorState>();
  static final _profileNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.home,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.home,
                pageBuilder: (context, state) => const NoTransitionPage(child: HomePage()),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _batchesNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.batches,
                pageBuilder: (context, state) => const NoTransitionPage(child: BatchesPage()),
              ),
            ],
          ),

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
            navigatorKey: _chatsNavigatorKey,
            routes: [
              GoRoute(
                path: AppRoutes.chats,
                pageBuilder: (context, state) => const NoTransitionPage(child: ChatsPage()),
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
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: AppRoutes.settings,
        name: AppRoutes.settings,
        builder: (context, state) => const SettingsPage(),
      ),
    ],
  );
}