import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/values_manager.dart';

class MedicineCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const MedicineCard({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.kPadding),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: ColorManager.kPrimary),
              const SizedBox(width: 8),
              Text(
                title.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppPadding.kPadding),
          child,
        ],
      ),
    );
  }
}
