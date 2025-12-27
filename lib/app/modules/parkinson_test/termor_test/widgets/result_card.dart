import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultCard extends StatelessWidget {
  final String result;
  const ResultCard({super.key,required this.result});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.analytics,
              size: 40, color: Colors.green),
          const SizedBox(height: 10),
          Text(
            result,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'this_test'.tr,
            textAlign: TextAlign.center,
            style:const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
