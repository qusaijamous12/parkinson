import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';

class TitleAndSubtitle extends StatelessWidget {
  const TitleAndSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'manage_schedule'.tr,
          textAlign: TextAlign.center,
          style:getRegulerTextStyle(color: ColorManager.greyColor,fontSize: 14) ,
        ),
      ],
    );
  }
}
