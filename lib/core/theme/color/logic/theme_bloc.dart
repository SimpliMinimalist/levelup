import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Imports from your project structure
import '../app_theme_factory.dart';
import '../tokens/app_tokens.dart';
import '../data/theme_repository.dart';

// Link the parts
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final IThemeRepository _repository;

  static const Color _primaryColor = Color(0xFF0284C7);

  ThemeBloc({required IThemeRepository repository})
      : _repository = repository,
        super(ThemeState(
          themeMode: ThemeMode.system,
          // Generate initial Light Theme
          lightTheme: AppThemeFactory.create(
            tokens: AppTokens(seed: _primaryColor),
            brightness: Brightness.light,
          ),
          // Generate initial Dark Theme
          darkTheme: AppThemeFactory.create(
            tokens: AppTokens(seed: _primaryColor),
            brightness: Brightness.dark,
          ),
        )) {
    // Event Handlers
    on<LoadTheme>(_onLoadTheme);
    on<ToggleThemeMode>(_onToggleThemeMode);
  }

  /// Load saved preferences from Repository
  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    final savedMode = await _repository.getThemeMode();
    _emitTheme(savedMode, emit);
  }

  /// Toggle between Light, Dark, or System
  Future<void> _onToggleThemeMode(ToggleThemeMode event, Emitter<ThemeState> emit) async {
    await _repository.saveThemeMode(event.mode);
    _emitTheme(event.mode, emit);
  }

  /// Helper to generate both themes and emit the new state
  void _emitTheme(ThemeMode mode, Emitter<ThemeState> emit) {
    // 1. Initialize Tokens with the selected seed color
    final tokens = AppTokens(seed: _primaryColor);

    // 2. Generate the Light version
    final light = AppThemeFactory.create(
      tokens: tokens,
      brightness: Brightness.light,
    );

    // 3. Generate the Dark version
    final dark = AppThemeFactory.create(
      tokens: tokens,
      brightness: Brightness.dark,
    );

    // 4. Update State
    emit(ThemeState(
      themeMode: mode,
      lightTheme: light,
      darkTheme: dark,
    ));
  }
}