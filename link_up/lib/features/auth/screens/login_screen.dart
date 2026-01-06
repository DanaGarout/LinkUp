import 'package:flutter/material.dart';
import 'package:link_up/core/theme/theme.dart';
import 'package:link_up/core/custom_widgets/custom_button.dart';
import 'package:link_up/core/custom_widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
               Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.link,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'LinkUp',
                style: AppTextStyles.heading2,
              ),
              const SizedBox(height: 8),
              const Text(
                'Log in to continue connecting.',
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: 48),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Email', style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 8),
              const CustomTextField(
                hintText: 'name@example.com',
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 24),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text('Password', style: TextStyle(fontWeight: FontWeight.w600)),
              ),
              const SizedBox(height: 8),
              const CustomTextField(
                hintText: '••••••••',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_outlined, color: Colors.grey),
              ),
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                     Navigator.pushNamed(context, '/forgot_password');
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CustomButton(
                text: 'Log In',
                onPressed: () {
                   Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?', style: TextStyle(color: Colors.grey)),
                  TextButton(
                    onPressed: () {
                       Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
