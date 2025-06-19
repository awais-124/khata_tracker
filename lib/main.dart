import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khata_tracker/core/constants/theme.dart';
import 'package:khata_tracker/features/auth/auth_controller.dart';
import 'package:khata_tracker/features/debts/debt_controller.dart';
import 'package:khata_tracker/features/settings/settings_controller.dart';
import 'package:khata_tracker/shared/widgets/app_scaffold.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'package:khata_tracker/features/auth/presentation/screens/login_screen.dart';
import 'package:khata_tracker/features/auth/presentation/screens/register_screen.dart';
import 'package:khata_tracker/features/debts/presentation/screens/debts_screen.dart';
import 'package:khata_tracker/features/debts/presentation/screens/history_screen.dart';
import 'package:khata_tracker/features/settings/presentation/screens/settings_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => SettingsController()),
        ChangeNotifierProxyProvider<AuthController, DebtController>(
          create: (_) => DebtController(null),
          update:
              (_, authController, debtController) =>
                  DebtController(authController),
        ),
      ],
      child: const KhataTrackerApp(),
    ),
  );
}

class KhataTrackerApp extends StatelessWidget {
  const KhataTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsController = context.watch<SettingsController>();

    return MaterialApp(
      title: 'KhataTracker',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsController.themeMode,
      home: Consumer<AuthController>(
        builder: (context, authController, _) {
          return AppScaffold(
            child:
                authController.isAuthenticated
                    ? const DebtsScreen()
                    : const LoginScreen(),
          );
        },
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/debts': (context) => const DebtsScreen(),
        '/history': (context) => const HistoryScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
