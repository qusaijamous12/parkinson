import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/binding/add_medicine_binding.dart';
import '../../../data/controller/user_controller.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../add_medicine/index.dart';

class FloatingActionBtnHome extends StatelessWidget {
  const FloatingActionBtnHome({super.key});

  @override
  Widget build(BuildContext context) {
    final _user=Get.find<UserController>(tag: 'user_controller');
    return FloatingActionButton(
      backgroundColor: ColorManager.kPrimary,
      onPressed: ()=>Get.to(()=>const AddMedicineScreen(),binding: AddMedicineBinding(uid: _user.userModel!.uid)),
      child:const Icon(Icons.medical_information_outlined,color: Colors.white,),);
  }
}
