import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/contstant/color_manager.dart';
import '../../../../shared/contstant/style_manager.dart';
import '../../register/register.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'dont_have_account'.tr,
          style: getRegulerTextStyle(color: Colors.black),
        ),
        TextButton(onPressed: (){
          Get.to(()=>const RegisterScreen());
        }, child: Text(
          'sign_up'.tr,
          style: getRegulerTextStyle(color: ColorManager.kPrimary),
        ))
      ],
    );
  }
}
