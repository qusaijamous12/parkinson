import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/user_controller.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';

class NameAndEmail extends StatelessWidget {
  const NameAndEmail({super.key});

  @override
  Widget build(BuildContext context) {
    final _user=Get.find<UserController>(tag: 'user_controller');
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional.center,
          child: Text(
              '${_user.userModel?.name?.capitalizeFirst}',
              style:getMediumTextStyle(color: Colors.black,fontSize: FontSizeManager.fs20)),
        ),

        Text(
          '${_user.userModel?.email}',
          style: getRegulerTextStyle(color: ColorManager.lightGrey),
        ),
      ],
    );
  }
}
