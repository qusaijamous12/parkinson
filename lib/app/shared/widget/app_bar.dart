import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contstant/color_manager.dart';
import '../contstant/style_manager.dart';
import '../contstant/values_manager.dart';

class ScreenAppBar extends StatelessWidget {
  final String title;
  final bool isDoctorDetails;
  const ScreenAppBar({super.key,required this.title,this.isDoctorDetails=false});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 100,
      padding:const EdgeInsetsDirectional.symmetric(horizontal: AppPadding.kPadding),
      width: double.infinity,
      color: ColorManager.kPrimary,
      child: SafeArea(
        child: Row(
          spacing: AppPadding.kPadding/2,
          children: [
             GestureDetector(
                 onTap: ()=>Get.back(),
                 child:const  Icon(Icons.arrow_back,color: Colors.white,)),
            Expanded(
              child: Text(
                title.tr,
                style: getMediumTextStyle(color: Colors.white),
              ),
            ),
            if(isDoctorDetails)
            GestureDetector(
                onTap: ()=>Get.back(),
                child: const Icon(Icons.search,color: Colors.white,))
          ],
        ),
      ),
    );
  }
}
