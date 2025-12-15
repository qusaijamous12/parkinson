import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/contstant/color_manager.dart';
import '../../../../shared/contstant/style_manager.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return    RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            children: [
              TextSpan(
                  text: 'by_logging'.tr,
                  style: getRegulerTextStyle(color: ColorManager.lightGrey,fontSize: 14)
              ),
              TextSpan(
                  text: ' ${'terms_conditions'.tr}',
                  style: getRegulerTextStyle(color: Colors.black,fontSize: 14)
              ),
              TextSpan(
                  text: ' ${'and'.tr}',
                  style: getRegulerTextStyle(color: ColorManager.lightGrey,fontSize: 14)
              ),
              TextSpan(
                  text: ' ${'privacy_policy'.tr}',

                  style: getRegulerTextStyle(color: Colors.black,fontSize: 14)
              ),
            ]
        ));
  }
}
