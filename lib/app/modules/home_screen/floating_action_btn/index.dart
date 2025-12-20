import 'package:flutter/material.dart';

import '../../../shared/contstant/color_manager.dart';

class FloatingActionBtnHome extends StatelessWidget {
  const FloatingActionBtnHome({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ColorManager.kPrimary,
      onPressed: (){},
      child:const Icon(Icons.medical_information_outlined,color: Colors.white,),);
  }
}
