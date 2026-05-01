import 'package:flutter/material.dart';
import '../foundation/app_palettes.dart';
import 'i_design_tokens.dart';
import '../../typography/app_typography.dart';

// 1. NEW: Imports for the new folders
import '../../spacing/app_spacing.dart';
import '../../shape/app_shapes.dart';

class AppTokens implements IDesignTokens {
  final Color _seed;

  AppTokens({required Color seed}) : _seed = seed;

  @override
  Color get seedColor => _seed;

  // --- (All your existing colors are kept safe) ---
  @override
  Color get success => AppPalettes.success;
  @override
  Color get warning => AppPalettes.warning;
  @override
  Color get info => AppPalettes.info;
  @override
  Color get error => AppPalettes.error;

  // --- (The ONLY change: Swapping numbers for variables) ---
  
  @override
  // OLD: double get borderRadius => 16.0;
  // NEW: Matches 16.0, but comes from your central file
  double get borderRadius => AppShapes.r16; 

  @override
  // OLD: double get defaultPadding => 20.0;
  // NEW: Matches 20.0, but comes from your central file
  double get defaultPadding => AppSpacing.s20; 

  // --- (Typography logic is kept safe) ---
  @override
  TextTheme getTypography(Color fontColor) {
    return AppTypography.create(fontColor);
  }
}