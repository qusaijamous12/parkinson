import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/user_controller.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/style_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/widget/app_bar.dart';
import '../../shared/widget/my_button.dart';
import '../../shared/widget/my_text_field.dart';
import 'widgets/name_email.dart';
import 'widgets/user_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = Get.find<UserController>(tag: 'user_controller');
    return Scaffold(
      body: Column(
        children: [
          const ScreenAppBar(title: 'profile'),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.all(AppPadding.kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppPadding.kPadding,
                children: [
                  const UserImage(),
                  const NameAndEmail(),
                  const SizedBox(height: AppPadding.kPadding),
            
                  MyTextField(
                    hintText: '',
                    enabled: false,
                    textInputType: TextInputType.text,
                    controller: TextEditingController()..text=_user.userModel?.name??'',
                  ),
                  MyTextField(
                    hintText: '',
                    enabled: false,
                    textInputType: TextInputType.text,
                    controller: TextEditingController()..text=_user.userModel?.email??'',
                  ),
                  MyTextField(
                    hintText: '',
                    enabled: false,
                    textInputType: TextInputType.text,
                    controller: TextEditingController()..text=_user.userModel?.mobileNumber??'',
                  ),
                  MyTextField(
                    hintText: '',
                    enabled: false,
                    textInputType: TextInputType.text,
                    controller: TextEditingController()..text=_user.userModel?.uid??'',
                  ),
                  const Spacer(),
                  Align(
                      alignment: AlignmentDirectional.center,
                      child: MyBtn(title: 'log_out'.tr, onTap: ()=>_user.logOut())),
                  const SizedBox(
                    height: AppPadding.kPadding*2,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
