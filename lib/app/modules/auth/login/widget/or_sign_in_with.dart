import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../shared/contstant/color_manager.dart';
import '../../../../shared/contstant/style_manager.dart';

class OrSignInWith extends StatelessWidget {
  const OrSignInWith({super.key});

  @override
  Widget build(BuildContext context) {
    return    Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: ColorManager.lightGrey,
          ),
        ),
        Text(
          '  ${'or_sign_with'.tr}  ',
          style: getRegulerTextStyle(color: ColorManager.lightGrey),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: ColorManager.lightGrey,
          ),
        ),
      ],
    );
  }
}
