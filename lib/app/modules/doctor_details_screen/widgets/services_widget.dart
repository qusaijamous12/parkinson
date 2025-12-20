import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../../shared/widget/my_divider.dart';
import '../../home_screen/widget/title_home_widget.dart';

class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleHomeWidget(title: 'services'),
        const SizedBox(
          height: AppPadding.kPadding/2,
        ),
        for(var i=0 ; i<3;i++)...[
          Row(
            spacing: AppPadding.kPadding/2,
            children: [
              Text(
                '${i+1}-',
                style: getMediumTextStyle(color: ColorManager.kPrimary,fontSize: FontSizeManager.fs18),
              ),
              Text(
                'patient_care'.tr,
                style: getRegulerTextStyle(color: ColorManager.lightGrey,fontSize: FontSizeManager.fs16),
              )
            ],
          ),
          const MyDivider()
        ]

      ],
    );
  }
}
