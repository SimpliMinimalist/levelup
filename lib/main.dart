import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Core
import 'core/theme/color/data/theme_repository.dart';
import 'core/theme/color/logic/theme_bloc.dart';
import 'core/navigation/app_router.dart'; // <--- Import Router

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final repo = ThemeRepository();

  runApp(
    BlocProvider(
      create: (_) => ThemeBloc(repository: repo)..add(LoadTheme()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        // CHANGED: MaterialApp.router
        return MaterialApp.router(
          title: 'Flutter Enterprise App',
          debugShowCheckedModeBanner: false,
          
          // Router Config
          routerConfig: AppRouter.router,

          // Theme Config
          theme: state.lightTheme,
          darkTheme: state.darkTheme,
          themeMode: state.themeMode,
        );
      },
    );
  }
}