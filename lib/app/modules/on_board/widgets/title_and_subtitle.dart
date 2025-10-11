import 'package:flutter/material.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';

class TitleAndSubtitle extends StatelessWidget {
  const TitleAndSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
          textAlign: TextAlign.center,
          style:getRegulerTextStyle(color: ColorManager.greyColor,fontSize: 14) ,
        ),
      ],
    );
  }
}
