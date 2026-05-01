import 'package:flutter/material.dart';
import '../buttons/app_button.dart';
import '../../color/extensions/theme_context_ext.dart';

class AppEmptyState extends StatelessWidget {
  final String title;
  final String message;
  final IconData? icon;
  final String? actionText;
  final VoidCallback? onAction;

  const AppEmptyState({
    super.key,
    required this.title,
    required this.message,
    this.icon,
    this.actionText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Circle
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: context.colors.surfaceContainerHighest,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon ?? Icons.inbox_outlined,
                size: 48,
                color: context.colors.primary,
              ),
            ),
            const SizedBox(height: 24),
            
            // Text
            Text(
              title,
              style: context.text.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            
            // Optional Action Button
            if (actionText != null && onAction != null) ...[
              const SizedBox(height: 24),
              AppButton(
                text: actionText!,
                onPressed: onAction,
                type: AppButtonType.secondary,
                isFullWidth: false,
              )
            ]
          ],
        ),
      ),
    );
  }
}