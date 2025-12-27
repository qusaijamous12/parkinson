import 'package:flutter/material.dart';

import '../../../shared/contstant/color_manager.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isMe;
  final String time;

  const ChatMessage({
    super.key,
    required this.message,
    required this.isMe,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isMe ? ColorManager.kPrimary : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isMe ? 16 : 0),
            bottomRight: Radius.circular(isMe ? 0 : 16),
          ),
          boxShadow: [
           const BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black87,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(
                color: (isMe ? Colors.white70 : Colors.black45),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
