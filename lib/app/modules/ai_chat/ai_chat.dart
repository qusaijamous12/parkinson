import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/widget/app_bar.dart';
import '../chat/widget/chat_message.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class AiChat extends StatefulWidget {
  const AiChat({super.key});

  @override
  State<AiChat> createState() => _AiChatState();
}
class _AiChatState extends State<AiChat> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _messageController = TextEditingController();

  final List<Map<String, dynamic>> _messages = [];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ScreenAppBar(title: 'Chat AI'),

          /// CHAT LIST
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ChatMessage(
                  message: msg['content'],
                  isMe: msg['sender'] == 'user',
                  time: msg['time'],
                );
              },
            ),
          ),

          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),

          /// INPUT
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildInputBar() {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.kPadding),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: ColorManager.kPrimary),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundColor: ColorManager.kPrimary,
            radius: 28,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: _sendMessage,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _sendMessage() async {
    final text = _messageController.text.trim();
    if (text.isEmpty || _isLoading) return;

    _messageController.clear();

    setState(() {
      _messages.add({
        'sender': 'user',
        'content': text,
        'time': _timeNow(),
      });
      _isLoading = true;
    });

    _scrollToBottom();

    try {
      final aiReply = await fetchAIResponse(text);

      setState(() {
        _messages.add({
          'sender': 'ai',
          'content': aiReply,
          'time': _timeNow(),
        });
      });
    } catch (e) {
      Get.snackbar('Error', 'Failed to get AI response');
    } finally {
      setState(() => _isLoading = false);
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 300), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  String _timeNow() {
    final now = TimeOfDay.now();
    return now.format(context);
  }
Future<String> fetchAIResponse(String message) async {
  final apiKey = dotenv.env['OPENAI_API_KEY'];

  if (apiKey == null || apiKey.isEmpty) {
    throw Exception('OPENAI_API_KEY not found in .env');
  }
  final response = await http.post(
    Uri.parse('https://api.openai.com/v1/chat/completions'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${apiKey}',
    },
    body: jsonEncode({
      'model': 'gpt-3.5-turbo',
      'messages': [
        {'role': 'user', 'content': message},
      ],
    }),
  );
  if (response.statusCode == 200) {
    final data =
    jsonDecode(utf8.decode(response.bodyBytes)); // Ensure UTF-8 decoding
    return data['choices'][0]['message']
    ['content']; // Adjust based on the response structure
  } else {
    throw Exception('Failed to load AI response: ${response.body}');
  }
}
}

