import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/contstant/color_manager.dart';
import '../../shared/widget/app_bar.dart';
import 'widget/chat_message.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controller/home_controller.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/widget/app_bar.dart';
import 'widget/chat_message.dart';

class MessageScreen extends StatefulWidget {
  final String doctorId;
  final String doctorName;
  final String doctorImage;

  const MessageScreen({
    super.key,
    required this.doctorId,
    required this.doctorName,
    required this.doctorImage,
  });

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final _homeController = Get.find<HomeController>(tag: 'home_controller');
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _homeController.getMessages(receiverId: widget.doctorId);
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    final now = DateTime.now();
    final formattedDate = now.toIso8601String();

    _homeController.sendMessage(
      receiverId: widget.doctorId,
      dateTime: formattedDate,
      text: text,
      profileImage: widget.doctorImage,
    );

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ScreenAppBar(title: widget.doctorName.capitalizeFirst??''),
          Expanded(
            child: Obx(() {
              final messages = _homeController.listChatModel
                  .where((m) => m.reciverId == widget.doctorId || m.senderId == widget.doctorId)
                  .toList()
                  .reversed
                  .toList(); // show latest messages at bottom
              if (messages.isEmpty) {
                return  Center(
                  child: Text(
                    'no_messages_yet'.tr,
                    style:const TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                );
              }
              return ListView.builder(
                reverse: true,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  return ChatMessage(
                    message: msg.text ?? '',
                    isMe: msg.senderId == _homeController.userModel?.uid,
                    time: msg.dateTime != null
                        ? DateTime.parse(msg.dateTime!).hour.toString().padLeft(2, '0') +
                        ':' +
                        DateTime.parse(msg.dateTime!).minute.toString().padLeft(2, '0')
                        : '',
                  );
                },
              );
            }),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: ColorManager.kPrimary
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _messageController,
                  decoration: InputDecoration(
                    hintText: 'type_message'.tr,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 25,
              backgroundColor: ColorManager.kPrimary,
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white),
                onPressed: _sendMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

