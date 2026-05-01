import 'package:flutter/material.dart';
import 'semantic_extension.dart';

extension ThemeGetter on BuildContext {
  // 1. Standard Colors
  ColorScheme get colors => Theme.of(this).colorScheme;
  
  // 2. Text Styles
  TextTheme get text => Theme.of(this).textTheme;

  // 3. Custom Semantic Colors
  SemanticColors get semantics => Theme.of(this).extension<SemanticColors>()!;
}