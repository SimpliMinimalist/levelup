import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

// Imports from your project structure
import '../app_theme_factory.dart';
import '../tokens/app_tokens.dart';
import '../model/app_supported_theme.dart';
import '../data/theme_repository.dart';

// Link the parts
part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final IThemeRepository _repository;

  ThemeBloc({required IThemeRepository repository})
      : _repository = repository,
        super(ThemeState(
          themeMode: ThemeMode.system,
          selectedColor: AppSupportedTheme.orange,
          // Generate initial Light Theme
          lightTheme: AppThemeFactory.create(
            tokens: AppTokens(seed: AppSupportedTheme.orange.seedColor),
            brightness: Brightness.light,
          ),
          // Generate initial Dark Theme
          darkTheme: AppThemeFactory.create(
            tokens: AppTokens(seed: AppSupportedTheme.orange.seedColor),
            brightness: Brightness.dark,
          ),
        )) {
    // Event Handlers
    on<LoadTheme>(_onLoadTheme);
    on<ToggleThemeMode>(_onToggleThemeMode);
    on<ChangeThemeColor>(_onChangeThemeColor);
  }

  /// Load saved preferences from Repository
  Future<void> _onLoadTheme(LoadTheme event, Emitter<ThemeState> emit) async {
    final savedMode = await _repository.getThemeMode();
    final savedColor = await _repository.getThemeColor();
    _emitTheme(savedMode, savedColor, emit);
  }

  /// Toggle between Light, Dark, or System
  Future<void> _onToggleThemeMode(ToggleThemeMode event, Emitter<ThemeState> emit) async {
    await _repository.saveThemeMode(event.mode);
    // Use current color, update mode
    _emitTheme(event.mode, state.selectedColor, emit);
  }

  /// Change the Brand Color (Seed)
  Future<void> _onChangeThemeColor(ChangeThemeColor event, Emitter<ThemeState> emit) async {
    await _repository.saveThemeColor(event.color);
    // Use current mode, update color
    _emitTheme(state.themeMode, event.color, emit);
  }

  /// Helper to generate both themes and emit the new state
  void _emitTheme(ThemeMode mode, AppSupportedTheme color, Emitter<ThemeState> emit) {
    // 1. Initialize Tokens with the selected seed color
    final tokens = AppTokens(seed: color.seedColor);

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
      selectedColor: color,
      lightTheme: light,
      darkTheme: dark,
    ));
  }
}