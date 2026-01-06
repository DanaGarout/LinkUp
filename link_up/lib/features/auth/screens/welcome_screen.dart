import 'package:flutter/material.dart';
import 'package:link_up/core/theme/theme.dart';
import 'package:link_up/core/custom_widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(),
              // Placeholder for Hero Image
              Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Icon(Icons.network_check, size: 80, color: Colors.grey),
              ),
              const SizedBox(height: 40),
               Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.chat_bubble_outline,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'LinkUp',
                style: AppTextStyles.heading1,
              ),
              const SizedBox(height: 8),
              const Text(
                'Connect instantly. Chat securely.',
                style: AppTextStyles.bodyMedium,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   _buildFeatureBadge('Secure', Icons.lock),
                   const SizedBox(width: 8),
                   _buildFeatureBadge('Fast', Icons.bolt),
                   const SizedBox(width: 8),
                   _buildFeatureBadge('Simple', Icons.check_circle),
                ],
              ),
              const Spacer(),
              Text('Get started with LinkUp today', style: AppTextStyles.bodyMedium),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Create account',
                onPressed: () {
                   Navigator.pushNamed(context, '/signup');
                },
              ),
              const SizedBox(height: 16),
              CustomButton(
                text: 'Log in',
                isOutline: true,
                onPressed: () {
                   Navigator.pushNamed(context, '/login');
                },
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Terms of Service', style:  AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                  const SizedBox(width: 8),
                  const Text('•', style: TextStyle(color: Colors.grey)),
                  const SizedBox(width: 8),
                  Text('Privacy Policy', style:  AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureBadge(String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.inputBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: AppColors.primary),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textMain),
          ),
        ],
      ),
    );
  }
}
