import 'package:flutter/material.dart';
import 'package:khata_tracker/features/auth/presentation/widgets/auth_form.dart';
import 'package:khata_tracker/features/auth/presentation/widgets/social_auth_buttons.dart';
import 'package:khata_tracker/shared/widgets/app_scaffold.dart';
import 'package:khata_tracker/shared/widgets/custom_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              'Create Account',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const AuthForm(isLogin: false),
            const SizedBox(height: 20),
            const SocialAuthButtons(),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Already have an account? Login',
              variant: ButtonVariant.text,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
