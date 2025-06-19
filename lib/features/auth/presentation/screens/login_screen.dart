import 'package:flutter/material.dart';
import 'package:khata_tracker/features/auth/auth_controller.dart';
import 'package:khata_tracker/features/auth/presentation/widgets/auth_form.dart';
import 'package:khata_tracker/features/auth/presentation/widgets/social_auth_buttons.dart';
import 'package:khata_tracker/shared/widgets/app_scaffold.dart';
import 'package:khata_tracker/shared/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      showDrawer: false,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Text(
              'KhataTracker',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Track your debts easily',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            const AuthForm(isLogin: true),
            const SizedBox(height: 20),
            const SocialAuthButtons(),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Create an account',
              variant: ButtonVariant.text,
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
            ),
            const SizedBox(height: 10),
            CustomButton(
              text: 'Forgot password?',
              variant: ButtonVariant.text,
              onPressed: () {
                Navigator.pushNamed(context, '/reset-password');
              },
            ),
          ],
        ),
      ),
    );
  }
}
