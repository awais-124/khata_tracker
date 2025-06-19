import 'package:flutter/material.dart';
import 'package:khata_tracker/features/auth/auth_controller.dart';
import 'package:khata_tracker/features/settings/settings_controller.dart';
import 'package:khata_tracker/shared/widgets/app_scaffold.dart';
import 'package:khata_tracker/shared/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = context.watch<SettingsController>();
    final authController = context.read<AuthController>();

    return AppScaffold(
      title: 'Settings',
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Appearance',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Theme'),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ChoiceChip(
                        label: const Text('System'),
                        selected:
                            settingsController.themeMode == ThemeMode.system,
                        onSelected: (_) {
                          settingsController.updateThemeMode(ThemeMode.system);
                        },
                      ),
                      const SizedBox(width: 8),
                      ChoiceChip(
                        label: const Text('Light'),
                        selected:
                            settingsController.themeMode == ThemeMode.light,
                        onSelected: (_) {
                          settingsController.updateThemeMode(ThemeMode.light);
                        },
                      ),
                      const SizedBox(width: 8),
                      ChoiceChip(
                        label: const Text('Dark'),
                        selected:
                            settingsController.themeMode == ThemeMode.dark,
                        onSelected: (_) {
                          settingsController.updateThemeMode(ThemeMode.dark);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text('User Profile'),
                    onTap: () {},
                  ),
                  const Divider(),
                  CustomButton(
                    text: 'Sign Out',
                    variant: ButtonVariant.text,
                    textColor: Colors.red,
                    onPressed: () async {
                      await authController.signOut();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
