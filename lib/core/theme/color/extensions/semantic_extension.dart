import 'package:flutter/material.dart';

@immutable
class SemanticColors extends ThemeExtension<SemanticColors> {
  final Color? success;
  final Color? warning;
  final Color? info;
  final Color? error; // <--- 1. ADD THIS FIELD

  const SemanticColors({
    required this.success,
    required this.warning,
    required this.info,
    required this.error, // <--- 2. ADD TO CONSTRUCTOR
  });

  @override
  SemanticColors copyWith({
    Color? success, 
    Color? warning, 
    Color? info,
    Color? error, // <--- 3. ADD TO COPYWITH
  }) {
    return SemanticColors(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      error: error ?? this.error, // <--- 4. ASSIGN IT
    );
  }

  @override
  SemanticColors lerp(ThemeExtension<SemanticColors>? other, double t) {
    if (other is! SemanticColors) return this;
    return SemanticColors(
      success: Color.lerp(success, other.success, t),
      warning: Color.lerp(warning, other.warning, t),
      info: Color.lerp(info, other.info, t),
      error: Color.lerp(error, other.error, t), // <--- 5. ADD LERP SUPPORT
    );
  }
}