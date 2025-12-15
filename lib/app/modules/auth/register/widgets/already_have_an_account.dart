import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/route_manager.dart';
import '../../../../shared/contstant/color_manager.dart';
import '../../../../shared/contstant/style_manager.dart';
import '../../login/login.dart';


class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'already_have'.tr,
          style: getRegulerTextStyle(color: Colors.black),
        ),
        TextButton(onPressed: (){
          RouteManager.offAll(const LoginScreen());
        }, child: Text(
          'sign_in'.tr,
          style: getRegulerTextStyle(color: ColorManager.kPrimary),
        ))
      ],
    );
  }
}
