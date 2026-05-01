import 'package:flutter/material.dart';
import 'tokens/i_design_tokens.dart';
import 'extensions/semantic_extension.dart';

class AppThemeFactory {
  static ThemeData create({
    required IDesignTokens tokens,
    required Brightness brightness,
  }) {
    // 1. Generate M3 Scheme
    final colorScheme = ColorScheme.fromSeed(
      seedColor: tokens.seedColor,
      brightness: brightness,
      error: tokens.error,
    );

    // 2. Generate Typography
    final textTheme = tokens.getTypography(colorScheme.onSurface);

    // 3. Create Base Theme
    final baseTheme = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      textTheme: textTheme,
    );

    // 4. Apply Customizations
    return baseTheme.copyWith(
      // BUTTONS
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(tokens.borderRadius),
          ),
          padding: EdgeInsets.all(tokens.defaultPadding),
          textStyle: textTheme.labelLarge, 
        ),
      ),
      
      // --- REMOVED CARD THEME TO FIX CONFLICT ---
      // The error suggests a package conflict (CardThemeData vs CardTheme).
      // We will skip global card styling for now to ensure compilation.
      
      // EXTENSIONS
      extensions: [
        SemanticColors(
          success: tokens.success,
          warning: tokens.warning,
          info: tokens.info,
          error: tokens.error, 
        ),
      ],
    );
  }
}