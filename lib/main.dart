import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/color/data/theme_repository.dart';
import 'core/theme/color/logic/theme_bloc.dart';
import 'core/navigation/app_router.dart';

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
        return MaterialApp.router(
          title: 'Flutter Enterprise App',
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          theme: state.lightTheme,
          darkTheme: state.darkTheme,
          themeMode: state.themeMode,
        );
      },
    );
  }
}