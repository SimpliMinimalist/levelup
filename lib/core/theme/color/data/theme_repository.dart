import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IThemeRepository {
  Future<void> saveThemeMode(ThemeMode mode);
  Future<ThemeMode> getThemeMode();
}

class ThemeRepository implements IThemeRepository {
  static const _kModeKey = 'theme_mode_v3';

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
}