import 'package:flutter/material.dart';
import 'package:link_up/core/theme/theme.dart';
import 'package:link_up/core/custom_widgets/custom_button.dart';
import 'package:link_up/core/custom_widgets/custom_textfield.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
        title: const Text('Sign Up', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
               Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary.withAlpha(25), // Light blue bg
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.chat_bubble,
                  size: 24,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Create your account',
                style: AppTextStyles.heading2,
              ),
              const SizedBox(height: 8),
              const Text(
                'Connect with friends instantly.',
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: 32),
              
              _buildInputLabel('Full Name (Optional)'),
              const CustomTextField(
                hintText: 'e.g., Jane Doe',
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              
              _buildInputLabel('Email Address'),
              const CustomTextField(
                hintText: 'name@example.com',
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 16),

              _buildInputLabel('Password'),
              const CustomTextField(
                hintText: '••••••••',
                prefixIcon: Icons.lock_outline,
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_outlined, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              _buildInputLabel('Confirm Password'),
              const CustomTextField(
                hintText: '••••••••',
                prefixIcon: Icons.lock_reset, // Using a similar icon
                obscureText: true,
                suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.grey),
              ),

              const SizedBox(height: 32),
              CustomButton(
                text: 'Create account',
                onPressed: () {
                   Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                },
              ),
              
              const SizedBox(height: 24),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Or continue with', style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 24),
              
              Row(
                children: [
                  Expanded(child: _buildSocialButton('Google', Icons.g_mobiledata)), // Placeholder icon for Google
                  const SizedBox(width: 16),
                  Expanded(child: _buildSocialButton('Apple', Icons.apple)),
                ],
              ),

              const SizedBox(height: 24),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?', style: TextStyle(color: Colors.grey)),
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
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
      ),
    );
  }

  Widget _buildSocialButton(String text, IconData icon) {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
