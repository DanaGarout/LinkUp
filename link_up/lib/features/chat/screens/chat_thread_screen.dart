import 'package:flutter/material.dart';
import 'package:link_up/core/theme/theme.dart';
import 'video_call_screen.dart';

class ChatThreadScreen extends StatelessWidget {
  const ChatThreadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5), // Light grey background for chat
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, size: 20, color: Colors.white),
            ),
             SizedBox(width: 10),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sarah Jenkins', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Online', style: TextStyle(color: AppColors.primary, fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VideoCallScreen()),
              );
            },
            icon: const Icon(Icons.videocam, color: Colors.black),
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline, color: Colors.black)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const Center(child: Text('Yesterday', style: TextStyle(color: Colors.grey, fontSize: 12))),
                const SizedBox(height: 16),
                _buildMessageBubble(
                  'Hey! Are we still on for the meeting tomorrow? I wanted to go over the project timeline.',
                  isMe: false,
                  time: '4:30 PM',
                ),
                _buildMessageBubble(
                  'Yes, definitely. 2 PM right?',
                  isMe: true,
                  time: '4:32 PM',
                  isRead: true,
                ),
                _buildMessageBubble(
                  'Perfect. See you then!',
                  isMe: false,
                  time: '4:33 PM',
                ),
                const SizedBox(height: 16),
                const Center(child: Text('Today', style: TextStyle(color: Colors.grey, fontSize: 12))),
                const SizedBox(height: 16),
                 _buildMessageBubble(
                  'I\'m running about 5 minutes late, traffic is crazy! 🚗',
                  isMe: true,
                  time: '1:55 PM',
                  isRead: true,
                ),
                _buildMessageBubble(
                  'No worries at all, take your time.\nI\'ll be in the lobby.',
                  isMe: false,
                  time: '1:56 PM',
                ),
              ],
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String text, {required bool isMe, required String time, bool isRead = false}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        constraints: const BoxConstraints(maxWidth: 280),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isMe ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: isMe ? const Radius.circular(16) : Radius.zero,
            bottomRight: isMe ? Radius.zero : const Radius.circular(16),
          ),
          boxShadow: [
             BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 2, offset: const Offset(0, 1)),
          ],
        ),
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.end,
           children: [
             Text(
               text,
               style: TextStyle(color: isMe ? Colors.white : Colors.black87, fontSize: 15),
             ),
             const SizedBox(height: 4),
             Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Text(time, style: TextStyle(color: isMe ? Colors.white70 : Colors.grey, fontSize: 10)),
                 if(isMe) ...[
                   const SizedBox(width: 4),
                   Icon(isRead ? Icons.done_all : Icons.done, size: 12, color: Colors.white70),
                 ],
               ],
             ),
           ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle, color: Colors.grey)),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.inputBackground,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.emoji_emotions_outlined, color: Colors.grey),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.send, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}
