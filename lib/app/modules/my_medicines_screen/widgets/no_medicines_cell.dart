import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/binding/add_medicine_binding.dart';
import '../../../data/controller/user_controller.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../add_medicine/index.dart';

class NoMedicinesCell extends StatelessWidget {
  const NoMedicinesCell({super.key});

  @override
  Widget build(BuildContext context) {
    final _user=Get.find<UserController>(tag: 'user_controller');
    return  Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Optional: illustration or icon
            Icon(
              Icons.medical_services_outlined,
              size: 100,
              color: ColorManager.kPrimary.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 24),
            Text(
              'no_medicines_yet'.tr,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'add_your_medicines'.tr,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Get.back();
                Get.to(()=>const AddMedicineScreen(),binding: AddMedicineBinding(uid: _user.userModel!.uid));
              },
              icon: const Icon(Icons.add,color: Colors.white,),
              label:  Text('add_medicine'.tr,style:getRegulerTextStyle(color: Colors.white) ,),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.kPrimary,
                padding:
                const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
