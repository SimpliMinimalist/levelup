import 'package:flutter/material.dart';
import '../../color/extensions/theme_context_ext.dart';

enum AppButtonType { primary, secondary, outline, text }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final bool isLoading;
  final IconData? icon;
  final bool isFullWidth;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = AppButtonType.primary,
    this.isLoading = false,
    this.icon,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Loading Indicator
    final loader = SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        color: type == AppButtonType.outline || type == AppButtonType.text
            ? context.colors.primary
            : context.colors.onPrimary,
      ),
    );

    // 2. Button Content (Icon + Text)
    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null && !isLoading) ...[
          Icon(icon, size: 20),
          const SizedBox(width: 8),
        ],
        isLoading ? loader : Text(text),
      ],
    );

    // 3. Select the underlying Flutter Widget based on Type
    Widget buttonWidget;
    switch (type) {
      case AppButtonType.primary:
        buttonWidget = FilledButton(
          onPressed: isLoading ? null : onPressed,
          child: content,
        );
        break;
      case AppButtonType.secondary:
        buttonWidget = FilledButton.tonal(
          onPressed: isLoading ? null : onPressed,
          child: content,
        );
        break;
      case AppButtonType.outline:
        buttonWidget = OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          child: content,
        );
        break;
      case AppButtonType.text:
        buttonWidget = TextButton(
          onPressed: isLoading ? null : onPressed,
          child: content,
        );
        break;
    }

    // 4. Handle Full Width Layout
    if (isFullWidth) {
      return SizedBox(width: double.infinity, child: buttonWidget);
    }
    return buttonWidget;
  }
}