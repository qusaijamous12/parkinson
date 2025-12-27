import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/contstant/color_manager.dart';

class TestCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;

  const TestCard({super.key, required this.title, required this.description, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset:  Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
             Icon(Icons.assessment, color:ColorManager.kPrimary , size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title.tr, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(description.tr, style: const TextStyle(fontSize: 14, color: Colors.black87)),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}