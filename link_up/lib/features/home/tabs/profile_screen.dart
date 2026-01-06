import 'package:flutter/material.dart';
import 'package:link_up/core/theme/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F5F5),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black), // In tabs this usually isn't there, but per design it is.
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/placeholder_avatar.png'), // Placeholder
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                 Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 2)),
                    ),
                    child: const Icon(Icons.edit, size: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Alex Richardson',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              'alex.richardson@example.com',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
            
            const SizedBox(height: 32),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('ACCOUNT SETTINGS', style: AppTextStyles.bodyMedium),
              ),
            ),
            const SizedBox(height: 8),
            _buildSettingsContainer(
              children: [
                _buildSettingsItem(Icons.person_outline, 'Edit Profile', onTap: (){}),
                const Divider(height: 1),
                _buildSettingsItem(
                  Icons.notifications_outlined, 
                  'Notifications', 
                  trailing: Transform.scale(
                    scale: 0.8,
                    child: Switch(value: true, onChanged: (v){}, activeColor: AppColors.primary),
                  ),
                ),
                const Divider(height: 1),
                _buildSettingsItem(Icons.lock_outline, 'Privacy & Security', onTap: (){}),
              ],
            ),

            const SizedBox(height: 24),
            
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('APP', style: AppTextStyles.bodyMedium),
              ),
            ),
             const SizedBox(height: 8),
             _buildSettingsContainer(
              children: [
                _buildSettingsItem(Icons.language, 'Language', trailing: const Row(children: [Text('English', style: TextStyle(color: Colors.grey)), Icon(Icons.chevron_right, color: Colors.grey)])),
                 const Divider(height: 1),
                _buildSettingsItem(Icons.help_outline, 'Help & Support', onTap: (){}),
              ],
            ),

            const SizedBox(height: 32),
            
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 24),
               child: OutlinedButton(
                 onPressed: () {
                   Navigator.pushNamedAndRemoveUntil(context, '/welcome', (route) => false);
                 },
                 style: OutlinedButton.styleFrom(
                   padding: const EdgeInsets.symmetric(vertical: 16),
                   side: const BorderSide(color: Colors.red),
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                   backgroundColor: Colors.white,
                 ),
                 child: const Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(Icons.logout, color: Colors.red),
                     SizedBox(width: 8),
                     Text('Log Out', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                   ],
                 ),
               ),
            ),

            const SizedBox(height: 24),
            Column(
              children: [
                Container(padding: const EdgeInsets.all(8), decoration: BoxDecoration(color: AppColors.primary.withAlpha(25), borderRadius: BorderRadius.circular(8)), child: const Icon(Icons.chat_bubble, color: AppColors.primary, size: 20)),
                const SizedBox(height: 8),
                const Text('LinkUp v1.0.2', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsContainer({required List<Widget> children}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingsItem(IconData icon, String text, {Widget? trailing, VoidCallback? onTap}) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: AppColors.inputBackground, borderRadius: BorderRadius.circular(8)),
        child: Icon(icon, color: AppColors.primary, size: 20),
      ),
      title: Text(text, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
      trailing: trailing ?? const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
