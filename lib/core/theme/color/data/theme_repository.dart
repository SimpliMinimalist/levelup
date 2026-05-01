import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/app_supported_theme.dart';

abstract class IThemeRepository {
  Future<void> saveThemeMode(ThemeMode mode);
  Future<ThemeMode> getThemeMode();
  Future<void> saveThemeColor(AppSupportedTheme theme);
  Future<AppSupportedTheme> getThemeColor();
}

class ThemeRepository implements IThemeRepository {
  static const _kModeKey = 'theme_mode_v3';
  static const _kColorKey = 'theme_color_v3';

  @override
  Future<void> saveThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kModeKey, mode.index);
  }

  @override
  Future<ThemeMode> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(_kModeKey) ?? ThemeMode.system.index;
    return ThemeMode.values[index];
  }

  @override
  Future<void> saveThemeColor(AppSupportedTheme theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_kColorKey, theme.index);
  }

  @override
  Future<AppSupportedTheme> getThemeColor() async {
    final prefs = await SharedPreferences.getInstance();
    final index = prefs.getInt(_kColorKey) ?? 0; // Default to Orange
    return AppSupportedTheme.values[index];
  }
}