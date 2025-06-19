import 'package:flutter/material.dart';
import 'package:khata_tracker/features/auth/auth_controller.dart';
import 'package:khata_tracker/shared/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class SocialAuthButtons extends StatelessWidget {
  const SocialAuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('OR'),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 16),
        CustomButton(
          text: 'Continue with Google',
          icon: Icons.g_mobiledata,
          backgroundColor: Colors.white,
          textColor: Colors.black,
          borderColor: Colors.grey,
          onPressed: () {
            context.read<AuthController>().signInWithGoogle();
          },
        ),
      ],
    );
  }
}
