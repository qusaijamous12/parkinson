import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../data/controller/login_controller.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../../shared/widget/my_loading.dart';
import '../login/widget/or_sign_in_with.dart';
import '../login/widget/terms_and_conditions.dart';
import 'widgets/already_have_an_account.dart';
import 'widgets/register_data_form.dart';
import 'widgets/register_type.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _userController=Get.find<UserController>(tag: 'user_controller');
    return LoadingOverlay(isLoading: _userController.c, child: Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.symmetric(
            horizontal: AppPadding.kPadding,
            vertical: AppPadding.kPadding*3,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: getBoldTextStyle(
                  color: ColorManager.kPrimary,
                  fontSize: 25,
                ),
              ),

              const SizedBox(height:AppPadding.kPadding / 2),
              Text(
                'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                style: getBoldTextStyle(color: ColorManager.greyTextLogin,fontSize: FontSizeManager.fs14),
              ),
              const SizedBox(height:AppPadding.kPadding),

              const RegisterDataForm(),

              const SizedBox(height:AppPadding.kPadding *2),

              const OrSignInWith(),

              const SizedBox(height:AppPadding.kPadding *1.5),


              const RegisterType(),

              const SizedBox(
                height: AppPadding.kPadding,
              ),



              const TermsAndConditions(),
              const SizedBox(height:AppPadding.kPadding),


              const AlreadyHaveAnAccount(),

            ],
          ),
        ),
      ),
    ),progressIndicator:const MyLoading(),);
  }
}
