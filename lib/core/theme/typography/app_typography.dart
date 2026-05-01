import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Import siblings
import 'app_font_weights.dart';
import 'app_font_sizes.dart';

class AppTypography {
  static TextTheme create(Color fontColor) {
    final base = GoogleFonts.robotoTextTheme();

    return base.copyWith(
      // DISPLAY
      displayLarge: base.displayLarge?.copyWith(
        fontSize: AppFontSizes.h1,
        fontWeight: AppFontWeights.bold,
        color: fontColor,
      ),
      displayMedium: base.displayMedium?.copyWith(
        fontSize: AppFontSizes.h2,
        fontWeight: AppFontWeights.bold,
        color: fontColor,
      ),
      displaySmall: base.displaySmall?.copyWith(
        fontSize: AppFontSizes.h3,
        fontWeight: AppFontWeights.semiBold,
        color: fontColor,
      ),

      // HEADLINE
      headlineLarge: base.headlineLarge?.copyWith(
        fontSize: AppFontSizes.h4,
        fontWeight: AppFontWeights.semiBold,
        color: fontColor,
      ),
      headlineMedium: base.headlineMedium?.copyWith(
        fontSize: AppFontSizes.h5,
        fontWeight: AppFontWeights.medium,
        color: fontColor,
      ),
      headlineSmall: base.headlineSmall?.copyWith(
        fontSize: AppFontSizes.h6,
        fontWeight: AppFontWeights.medium,
        color: fontColor,
      ),

      // TITLE
      titleLarge: base.titleLarge?.copyWith(
        fontSize: AppFontSizes.h5,
        fontWeight: AppFontWeights.semiBold,
        color: fontColor,
      ),
      titleMedium: base.titleMedium?.copyWith(
        fontSize: AppFontSizes.h6,
        fontWeight: AppFontWeights.medium,
        color: fontColor,
      ),
      titleSmall: base.titleSmall?.copyWith(
        fontSize: AppFontSizes.bodyLg,
        fontWeight: AppFontWeights.medium,
        color: fontColor,
      ),

      // BODY
      bodyLarge: base.bodyLarge?.copyWith(
        fontSize: AppFontSizes.bodyLg,
        fontWeight: AppFontWeights.regular,
        color: fontColor,
      ),
      bodyMedium: base.bodyMedium?.copyWith(
        fontSize: AppFontSizes.bodyMd,
        fontWeight: AppFontWeights.regular,
        color: fontColor,
      ),
      bodySmall: base.bodySmall?.copyWith(
        fontSize: AppFontSizes.bodySm,
        fontWeight: AppFontWeights.regular,
        // FIXED: Replaced .withOpacity(0.7) with .withValues(alpha: 0.7)
        color: fontColor.withValues(alpha: 0.7),
      ),

      // LABELS
      labelLarge: base.labelLarge?.copyWith(
        fontSize: AppFontSizes.labelLg,
        fontWeight: AppFontWeights.bold,
        letterSpacing: 0.5,
        color: fontColor,
      ),
      labelSmall: base.labelSmall?.copyWith(
        fontSize: AppFontSizes.labelSm,
        fontWeight: AppFontWeights.medium,
        letterSpacing: 0.5,
        // FIXED: Replaced .withOpacity(0.6) with .withValues(alpha: 0.6)
        color: fontColor.withValues(alpha: 0.6),
      ),
    );
  }
}
