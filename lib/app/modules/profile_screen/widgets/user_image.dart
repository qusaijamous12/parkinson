import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/user_controller.dart';

class UserImage extends StatelessWidget {
  const UserImage({super.key});

  @override
  Widget build(BuildContext context) {
    final _user=Get.find<UserController>(tag: 'user_controller');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage('${_user.userModel?.imageUrl}'),
        )

      ],
    );
  }
}
