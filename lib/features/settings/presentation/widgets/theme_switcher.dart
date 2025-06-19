import 'package:flutter/material.dart';
import 'package:khata_tracker/features/settings/settings_controller.dart';
import 'package:provider/provider.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = context.watch<SettingsController>();

    return DropdownButton<ThemeMode>(
      value: settingsController.themeMode,
      onChanged: (ThemeMode? newThemeMode) {
        if (newThemeMode != null) {
          settingsController.updateThemeMode(newThemeMode);
        }
      },
      items: const [
        DropdownMenuItem(value: ThemeMode.system, child: Text('System Theme')),
        DropdownMenuItem(value: ThemeMode.light, child: Text('Light Theme')),
        DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark Theme')),
      ],
    );
  }
}
