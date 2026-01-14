import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/binding/add_medicine_binding.dart';
import '../../../data/controller/user_controller.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../add_medicine/index.dart';
import '../../ai_chat/ai_chat.dart';

class FloatingActionBtnHome extends StatelessWidget {
  const FloatingActionBtnHome({super.key});

  @override
  Widget build(BuildContext context) {
    final _user=Get.find<UserController>(tag: 'user_controller');
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: AppPadding.kPadding,
      children: [
        FloatingActionButton(
          backgroundColor: ColorManager.kPrimary,
          onPressed: ()=>Get.to(()=>const AiChat()),
          child:const Icon(Icons.smart_toy_outlined,color: Colors.white,),),
        FloatingActionButton(
          backgroundColor: ColorManager.kPrimary,
          onPressed: ()=>Get.to(()=>const AddMedicineScreen(),binding: AddMedicineBinding(uid: _user.userModel!.uid)),
          child:const Icon(Icons.medical_information_outlined,color: Colors.white,),)
      ],
    );
  }
}
