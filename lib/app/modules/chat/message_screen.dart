import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/contstant/color_manager.dart';
import '../../shared/widget/app_bar.dart';
import 'widget/chat_message.dart';


class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: Column(
            children: [
              const ScreenAppBar(title: 'chat'),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: ListView(
                    reverse: true,
                    children: const [
                      ChatMessage(
                        message: 'Hello! How are you?',
                        isMe: false,
                        time: '10:00 AM',
                      ),
                      ChatMessage(
                        message: 'I’m good, thanks! How about you?',
                        isMe: true,
                        time: '10:01 AM',
                      ),
                      ChatMessage(
                        message: 'Doing well! Are we still on for today?',
                        isMe: false,
                        time: '10:02 AM',
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                          const  BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
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
                        onPressed: () {

                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


