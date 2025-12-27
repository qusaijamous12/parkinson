import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/contstant/color_manager.dart';

class InstructionCard extends StatelessWidget {
  const InstructionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(Icons.info_outline,
                color: ColorManager.kPrimary),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'hold_your_phone'.tr,
                style:const TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      );
  }
}
