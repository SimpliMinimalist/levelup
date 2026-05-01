import 'package:flutter/material.dart';

abstract class IDesignTokens {
  // The Seed that drives Material 3
  Color get seedColor;

  // Semantic Colors (Extensions)
  Color get success;
  Color get warning;
  Color get info;
  Color get error;

  // Global Shapes & Spacing
  double get borderRadius;
  double get defaultPadding;

  TextTheme getTypography(Color fontColor);
}