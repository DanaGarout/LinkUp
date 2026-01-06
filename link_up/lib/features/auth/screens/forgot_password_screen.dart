import 'package:flutter/material.dart';
import 'package:link_up/core/theme/theme.dart';
import 'package:link_up/core/custom_widgets/custom_button.dart';
import 'package:link_up/core/custom_widgets/custom_textfield.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
               Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(25),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.restart_alt,
                  size: 30,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Forgot Password?',
                style: AppTextStyles.heading2,
              ),
              const SizedBox(height: 8),
              const Text(
                'Don\'t worry! It happens. Please enter the email address associated with your account.',
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: 32),
              
              const Text('Email Address', style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              const CustomTextField(
                hintText: 'name@example.com',
                prefixIcon: Icons.email_outlined,
              ),
              
              const SizedBox(height: 32),
              CustomButton(
                text: 'Send Reset Link',
                onPressed: () {
                   // Navigate back or show splash dialog
                   Navigator.pop(context);
                },
              ),

              const Spacer(),
              
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Remember your password?', style: TextStyle(color: Colors.grey)),
                  TextButton(
                    onPressed: () {
                       Navigator.pop(context);
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
