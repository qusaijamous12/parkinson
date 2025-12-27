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
        Row(
          spacing: AppPadding.kPadding/2,
          children: [
            Text(
              '${1}-',
              style: getMediumTextStyle(color: ColorManager.kPrimary,fontSize: FontSizeManager.fs18),
            ),
            Text(
              'patient_care'.tr,
              style: getRegulerTextStyle(color: ColorManager.lightGrey,fontSize: FontSizeManager.fs14),
            )
          ],
        ),
        const MyDivider(),
        Row(
          spacing: AppPadding.kPadding/2,
          children: [
            Text(
              '${2}-',
              style: getMediumTextStyle(color: ColorManager.kPrimary,fontSize: FontSizeManager.fs18),
            ),
            Text(
              'if_run_your'.tr,
              style: getRegulerTextStyle(color: ColorManager.lightGrey,fontSize: FontSizeManager.fs14),
            )
          ],
        ),
        const MyDivider(),
        Row(
          spacing: AppPadding.kPadding/2,
          children: [
            Text(
              '${3}-',
              style: getMediumTextStyle(color: ColorManager.kPrimary,fontSize: FontSizeManager.fs18),
            ),
            Text(
              'that_why_some'.tr,
              style: getRegulerTextStyle(color: ColorManager.lightGrey,fontSize: FontSizeManager.fs14),
            )
          ],
        ),
        const MyDivider()

      ],
    );
  }
}
