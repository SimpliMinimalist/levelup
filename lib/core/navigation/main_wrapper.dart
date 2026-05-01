import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_assets.dart'; 
import '../theme/color/extensions/theme_context_ext.dart'; 

class MainWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainWrapper({
    super.key,
    required this.navigationShell,
  });

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    // FIX: Renamed from '_buildIcon' to 'buildIcon' (Removed underscore)
    Widget buildIcon(String path, {required bool isSelected}) {
      return SvgPicture.asset(
        path,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          isSelected ? context.colors.primary : context.colors.onSurfaceVariant,
          BlendMode.srcIn,
        ),
      );
    }

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        destinations: [
          // 1. STORE TAB
          NavigationDestination(
            // Updated function calls
            icon: buildIcon(AppAssets.store, isSelected: false), 
            selectedIcon: buildIcon(AppAssets.storeFilled, isSelected: true), 
            label: 'Store',
          ),
          
          // 2. ORDERS TAB
          NavigationDestination(
            icon: buildIcon(AppAssets.orders, isSelected: false),
            selectedIcon: buildIcon(AppAssets.ordersFilled, isSelected: true),
            label: 'Orders',
          ),
          
          // 3. PROFILE TAB
          NavigationDestination(
            icon: buildIcon(AppAssets.profile, isSelected: false),
            selectedIcon: buildIcon(AppAssets.profileFilled, isSelected: true),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}