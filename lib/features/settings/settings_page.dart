import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/color/logic/theme_bloc.dart';
import '../../core/theme/color/model/app_supported_theme.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Appearance")),
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return ListView(
            padding: const EdgeInsets.all(24),
            children: [

              Text(
                "Accent Color",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: AppSupportedTheme.values.map((supportedTheme) {
                  final isSelected = state.selectedColor == supportedTheme;
                  
                  return GestureDetector(
                    onTap: () {
                      context.read<ThemeBloc>().add(ChangeThemeColor(supportedTheme));
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: supportedTheme.seedColor,
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(width: 4, color: colorScheme.onSurface)
                            : Border.all(width: 1, color: Colors.transparent),
                        boxShadow: [
                          if (isSelected)
                            BoxShadow(
                              color: supportedTheme.seedColor.withValues(alpha: 0.5),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            )
                        ],
                      ),
                      child: isSelected
                          ? const Icon(Icons.check, color: Colors.white)
                          : null,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 32),
              const Divider(),
              const SizedBox(height: 32),


              Text(
                "Display Mode",
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),


              _CustomRadioTile<ThemeMode>(
                value: ThemeMode.system,
                groupValue: state.themeMode,
                label: "System Default",
                icon: Icons.brightness_auto,
                onChanged: (val) => context.read<ThemeBloc>().add(ToggleThemeMode(val)),
              ),
              const SizedBox(height: 8),


              _CustomRadioTile<ThemeMode>(
                value: ThemeMode.light,
                groupValue: state.themeMode,
                label: "Light Mode",
                icon: Icons.wb_sunny_rounded,
                onChanged: (val) => context.read<ThemeBloc>().add(ToggleThemeMode(val)),
              ),
              const SizedBox(height: 8),


              _CustomRadioTile<ThemeMode>(
                value: ThemeMode.dark,
                groupValue: state.themeMode,
                label: "Dark Mode",
                icon: Icons.nightlight_round,
                onChanged: (val) => context.read<ThemeBloc>().add(ToggleThemeMode(val)),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CustomRadioTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String label;
  final IconData icon;
  final ValueChanged<T> onChanged;

  const _CustomRadioTile({
    required this.value,
    required this.groupValue,
    required this.label,
    required this.icon,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = value == groupValue;
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => onChanged(value),
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? colorScheme.primary : colorScheme.outlineVariant,
            width: isSelected ? 2 : 1,
          ),
          color: isSelected ? colorScheme.primary.withValues(alpha: 0.05) : null,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected ? colorScheme.primary : colorScheme.onSurface,
                ),
              ),
            ),
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
              color: isSelected ? colorScheme.primary : colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}