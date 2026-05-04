import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/components/display/app_list_tile.dart';
import '../../core/navigation/app_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(radius: 40, child: Icon(Icons.person, size: 40)),
          const SizedBox(height: 10),
          const Center(child: Text("John Doe", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          
          const SizedBox(height: 30),
          
          AppListTile(
            title: "Settings",
            leading: const Icon(Icons.settings),
            onTap: () {
              context.pushNamed(AppRoutes.settings);
            },
          ),
        ],
      ),
    );
  }
}