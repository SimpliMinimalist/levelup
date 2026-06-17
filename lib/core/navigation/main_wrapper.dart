import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_assets.dart'; 
import '../theme/color/extensions/theme_context_ext.dart'; 
import 'app_routes.dart';

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

    Widget buildMaterialIcon(IconData iconData, {required bool isSelected}) {
      return Icon(
        iconData,
        color: isSelected ? context.colors.primary : context.colors.onSurfaceVariant,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('LevelUp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: [
              ListTile(
                leading: const Icon(Icons.download_done),
                title: const Text('Offline Downloads'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.library_books),
                title: const Text('Free Material'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.star_rate),
                title: const Text('Students Testimonials'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Edit Profile'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context); // close the drawer
                  context.push(AppRoutes.settings);
                },
              ),
              ListTile(
                leading: const Icon(Icons.privacy_tip_outlined),
                title: const Text('Privacy Policy'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        destinations: [
          // 1. HOME TAB
          NavigationDestination(
            icon: buildMaterialIcon(Icons.home_outlined, isSelected: false),
            selectedIcon: buildMaterialIcon(Icons.home, isSelected: true),
            label: 'Home',
          ),

          // 2. BATCHES TAB
          NavigationDestination(
            icon: buildMaterialIcon(Icons.people_outline, isSelected: false),
            selectedIcon: buildMaterialIcon(Icons.people, isSelected: true),
            label: 'Batches',
          ),

          // 3. STORE TAB
          NavigationDestination(
            icon: buildMaterialIcon(Icons.book_outlined, isSelected: false), 
            selectedIcon: buildMaterialIcon(Icons.book, isSelected: true), 
            label: 'Store',
          ),
          
          // 4. CHATS TAB
          NavigationDestination(
            icon: buildMaterialIcon(Icons.chat_bubble_outline, isSelected: false),
            selectedIcon: buildMaterialIcon(Icons.chat_bubble, isSelected: true),
            label: 'Chats',
          ),
          
          // 5. PROFILE TAB
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