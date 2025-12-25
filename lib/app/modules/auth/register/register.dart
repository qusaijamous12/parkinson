import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../data/controller/user_controller.dart';
import '../../../data/enum/data_status.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../../shared/utils/utils.dart';
import '../../../shared/widget/my_loading.dart';
import '../login/widget/or_sign_in_with.dart';
import '../login/widget/terms_and_conditions.dart';
import 'widgets/already_have_an_account.dart';
import 'widgets/register_data_form.dart';
import 'widgets/register_type.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _userController=Get.find<UserController>(tag: 'user_controller');

  @override
  Widget build(BuildContext context) {
    return Obx(()=>LoadingOverlay(isLoading:isLoading, child: GestureDetector(
      onTap: ()=>Utils.closeKeyboard(),
      child: Scaffold(
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
                  'create_account'.tr,
                  style: getBoldTextStyle(
                    color: ColorManager.kPrimary,
                    fontSize: 25,
                  ),
                ),

                const SizedBox(height:AppPadding.kPadding / 2),
                Text(
                  'sign'.tr,
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
      ),
    ),progressIndicator:const MyLoading(),));
  }


  ///My Loader Will Show When Sign In With Google Login Status is Loading and When Register Status is Loading
  bool get isLoading=> _userController.registerStatus.value==ApiStatus.loading||_userController.loginStatus.value==ApiStatus.loading;
}
