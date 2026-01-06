import 'package:flutter/material.dart';
import 'package:link_up/core/theme/theme.dart';

class ChatsListScreen extends StatelessWidget {
  const ChatsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Custom App Bar Area
            Padding(
               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                    Text('Chats', style: AppTextStyles.heading1),
                   const CircleAvatar(
                     radius: 20,
                     backgroundColor: Colors.grey,
                     child: Icon(Icons.person, color: Colors.white),
                   ),
                 ],
               ),
            ),
            
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.inputBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 16),

            // Chat List
            Expanded(
              child: ListView(
                children: [
                  _buildChatItem(
                    context,
                    name: 'Alice Smith',
                    message: 'Hey, are we still on for lunch today...',
                    time: '10:30 AM',
                    unreadCount: 2,
                    isImage: true, 
                  ),
                  _buildChatItem(
                    context,
                    name: 'Team Project',
                    message: 'The design assets have been...',
                    time: 'Yesterday',
                    isRead: true,
                    initials: 'TP',
                    color: Colors.blue.shade100,
                  ),
                  _buildChatItem(
                    context,
                    name: 'John Doe',
                    message: 'Call me when you can, need to discuss...',
                    time: 'Mon',
                  ),
                   _buildChatItem(
                    context,
                    name: 'Sarah Connor',
                    message: 'Sent an image.',
                    time: 'Sun',
                    isImage: true,
                  ),
                  _buildChatItem(
                    context,
                    name: 'Family Group',
                    message: 'Mom: Who is coming for dinner?',
                    time: 'Sun',
                    isMuted: true,
                    initials: 'FG',
                    color: Colors.orange.shade100,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock, size: 12, color: Colors.grey),
                        SizedBox(width: 4),
                        Text('End of encrypted messages', style: TextStyle(color: Colors.grey, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }

  Widget _buildChatItem(
    BuildContext context, {
    required String name,
    required String message,
    required String time,
    int unreadCount = 0,
    bool isRead = false,
    bool isMuted = false,
    String? initials,
    bool isImage = false,
    Color? color,
  }) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, '/chat');
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: color ?? Colors.grey[300],
        child: initials != null
            ? Text(initials, style: const TextStyle(color: Colors.black87, fontWeight: FontWeight.bold))
            : (isImage 
                ? const Icon(Icons.person, color: Colors.white) 
                : const Icon(Icons.person, color: Colors.white)),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        ],
      ),
      subtitle: Row(
        children: [
          Expanded(
            child: Text(
              message,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: unreadCount > 0 ? Colors.black87 : Colors.grey[600],
                fontWeight: unreadCount > 0 ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
          if (isMuted) const Padding(padding: EdgeInsets.only(left: 4), child: Icon(Icons.volume_off, size: 16, color: Colors.grey)),
          if (isRead) const Icon(Icons.done_all, size: 16, color: AppColors.primary),
          if (unreadCount > 0)
            Container(
              margin: const EdgeInsets.only(left: 8),
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Text(
                unreadCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
