import 'package:flutter/material.dart';
import '../../color/extensions/theme_context_ext.dart';

class AppListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool showArrow;

  const AppListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.onTap,
    this.showArrow = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      
      // Leading Icon/Image
      leading: leading,
      
      // Title (Bold)
      title: Text(
        title,
        style: context.text.titleMedium?.copyWith(fontWeight: FontWeight.w600),
      ),
      
      // Subtitle (Muted)
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: context.text.bodyMedium?.copyWith(
                color: context.colors.onSurfaceVariant,
              ),
            )
          : null,
          
      // Trailing (Custom or Arrow)
      trailing: trailing ?? (showArrow && onTap != null
          ? Icon(Icons.chevron_right, color: context.colors.outline)
          : null),
    );
  }
}