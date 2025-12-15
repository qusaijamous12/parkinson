import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../../data/controller/login_controller.dart';
import '../../../data/enum/data_status.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../../shared/utils/utils.dart';
import '../../../shared/widget/my_loading.dart';
import 'widget/dont_have_an_account.dart';
import 'widget/email_and_password_login.dart';
import 'widget/or_sign_in_with.dart';
import 'widget/sign_in_type.dart';
import 'widget/terms_and_conditions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _userController = Get.find<UserController>(tag: 'user_controller');

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoadingOverlay(
        isLoading: _userController.loginStatus.value == ApiStatus.loading,
        child: GestureDetector(
          onTap: ()=>Utils.closeKeyboard(),
          child: Scaffold(
            body: SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsetsDirectional.all(AppPadding.kPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'welcome_back'.tr,
                        style: getBoldTextStyle(
                          color: ColorManager.kPrimary,
                          fontSize: 25,
                        ),
                      ),

                      const SizedBox(height: AppPadding.kPadding / 2),

                      Text(
                        'we_are_excited'.tr,
                        style: getBoldTextStyle(
                          color: ColorManager.greyColor,
                          fontSize: FontSizeManager.fs14,
                        ),
                      ),
                      const SizedBox(height: AppPadding.kPadding * 1.5),

                      const EmailAndPasswordLogin(),

                      const SizedBox(height: AppPadding.kPadding),

                      const OrSignInWith(),

                      const SizedBox(height: AppPadding.kPadding * 1.5),

                      const SignInType(),

                      const SizedBox(height: AppPadding.kPadding * 2),

                      const TermsAndConditions(),
                      const SizedBox(height: AppPadding.kPadding),
                      const DontHaveAnAccount(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        progressIndicator: const MyLoading(),
      ),
    );
  }
}
