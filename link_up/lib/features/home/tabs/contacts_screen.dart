import 'package:flutter/material.dart';
import 'package:link_up/core/theme/theme.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton(
          onPressed: () {}, // Tab switch handles this actually, but design shows "Cancel" which implies modal. 
          // Since it's a tab in my impl, I'll keep it simple or maybe it should be a modal.
          // Based on screen flow, "New Chat" is usually a modal. 
          // However, the tab is named "Contacts". I will assume this screen serves as both.
          child: Text('Cancel', style: TextStyle(color: AppColors.primary)),
        ),
        leadingWidth: 80,
        title: const Text('New Chat', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.inputBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search name or number',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
          ),
          
          _buildActionItem(Icons.group_add, 'Create New Group'),
          _buildActionItem(Icons.share, 'Invite Friends'),
          
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('FREQUENTLY CONTACTED', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 8),

          // Horizontal Frequent Contacts
          SizedBox(
             height: 100,
             child: ListView(
               scrollDirection: Axis.horizontal,
               padding: const EdgeInsets.symmetric(horizontal: 16),
               children: [
                 _buildFrequentContact('Sarah Wilson', true),
                 _buildFrequentContact('Michael Brown', false),
                 _buildFrequentContact('Adeline King', false),
                  _buildFrequentContact('Alex Garcia', false),
               ],
             ),
          ),

          // Alphabetical List
          Expanded(
            child: ListView(
              children: [
                _buildSectionHeader('A'),
                _buildContactItem('Adeline King', 'Available'),
                _buildContactItem('Alex Garcia', 'At the gym 🏋️'),
                _buildSectionHeader('B'),
                _buildContactItem('Brandon Lee', 'Can\'t talk right now'),
                _buildSectionHeader('C'),
                _buildContactItem('Clara Jones', ''),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem(IconData icon, String text) {
     return ListTile(
       leading: Container(
         padding: const EdgeInsets.all(8),
         decoration: BoxDecoration(
           color: AppColors.primary.withAlpha(25),
           shape: BoxShape.circle,
         ),
         child: Icon(icon, color: AppColors.primary, size: 20),
       ),
       title: Text(text, style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600)),
     );
  }

  Widget _buildFrequentContact(String name, bool online) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, color: Colors.white),
              ),
              if (online)
                 Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: 60,
            child: Text(
              name.split(' ').first,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String letter) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(letter, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildContactItem(String name, String status) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor:  AppColors.inputBackground,
        child: Icon(Icons.person, color: Colors.grey),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: status.isNotEmpty ? Text(status, style: const TextStyle(color: Colors.grey, fontSize: 12)) : null,
    );
  }
}
