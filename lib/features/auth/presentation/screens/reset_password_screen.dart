import 'package:flutter/material.dart';
import 'package:khata_tracker/shared/widgets/app_scaffold.dart';
import 'package:khata_tracker/shared/widgets/custom_button.dart';
import 'package:khata_tracker/shared/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';
import 'package:khata_tracker/features/auth/auth_controller.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _emailController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    bool _isLoading = false;

    return AppScaffold(
      showDrawer: false,
      title: 'Reset Password',
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Enter your email to receive a password reset link',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: _emailController,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              StatefulBuilder(
                builder: (context, setState) {
                  return CustomButton(
                    text: 'Send Reset Link',
                    onPressed:
                        _isLoading
                            ? null
                            : () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => _isLoading = true);
                                try {
                                  await context
                                      .read<AuthController>()
                                      .resetPassword(
                                        _emailController.text.trim(),
                                      );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Password reset link sent to your email',
                                      ),
                                    ),
                                  );
                                  Navigator.pop(context);
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(e.toString())),
                                  );
                                } finally {
                                  setState(() => _isLoading = false);
                                }
                              }
                            },
                    isLoading: _isLoading,
                  );
                },
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Back to Login',
                variant: ButtonVariant.text,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
