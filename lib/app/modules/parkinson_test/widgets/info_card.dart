import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String description;

  const InfoCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          const  BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.tr, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(description.tr, style: const TextStyle(fontSize: 14, color: Colors.black87)),
        ],
      ),
    );
  }
}