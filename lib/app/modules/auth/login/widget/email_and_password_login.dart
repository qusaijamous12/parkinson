import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/controller/login_controller.dart';
import '../../../../data/enum/data_status.dart';
import '../../../../routes/route_manager.dart';
import '../../../../shared/contstant/color_manager.dart';
import '../../../../shared/contstant/style_manager.dart';
import '../../../../shared/contstant/values_manager.dart';
import '../../../../shared/helper/app_regx.dart';
import '../../../../shared/widget/my_button.dart';
import '../../../../shared/widget/my_text_field.dart';
import '../../forget_password.dart';
import 'password_terms.dart';

class EmailAndPasswordLogin extends StatefulWidget {
  const EmailAndPasswordLogin({super.key});

  @override
  State<EmailAndPasswordLogin> createState() => _EmailAndPasswordLoginState();
}

class _EmailAndPasswordLoginState extends State<EmailAndPasswordLogin> {
  final _userController = Get.find<UserController>(tag: 'user_controller');
  final _emailController = TextEditingController();
  final _formKey=GlobalKey<FormState>();
  bool isObsecure = false;
  late TextEditingController _passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasANumber = false;
  bool atLeast8Charcter = false;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    setUpPasswordListener();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MyTextField(
            hintText: 'email'.tr,
            textInputType: TextInputType.emailAddress,
            controller: _emailController,
            validate: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isValidEmail(value)) {
                return 'valid_email'.tr;
              }
              return null;
            },
          ),
          const SizedBox(height: AppPadding.kPadding),
          MyTextField(
            hintText: 'password'.tr,
            isPassword: true,
            textInputType: TextInputType.emailAddress,
            controller: _passwordController,
            validate: (value) {
              if (hasLowerCase &&
                  hasUpperCase &&
                  hasSpecialCharacter &&
                  hasANumber &&
                  atLeast8Charcter) {
                return null;
              } else {
                return 'password_terms'.tr;
              }
            },
          ),
          const SizedBox(height: AppPadding.kPadding / 2),
          PasswordTerms(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacter: hasSpecialCharacter,
            hasANumber: hasANumber,
            atLeast8Charcter: atLeast8Charcter,
          ),

          const SizedBox(height: AppPadding.kPadding),

          Align(
            alignment: AlignmentDirectional.topEnd,
            child: TextButton(
              onPressed: () {
                RouteManager.to(const ForgetPassword());
              },
              child: Text(
                'forgot_password'.tr,
                style: getMediumTextStyle(color: ColorManager.kPrimary),
              ),
            ),
          ),

          const SizedBox(height: AppPadding.kPadding),

          Obx(()=>MyBtn(
            onTap: () async {
              if(_formKey.currentState?.validate()??false){
                await _userController.login(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
              }

            },
            title: 'login'.tr,
            enabled: _userController.loginStatus.value!=ApiStatus.loading,

          ),)
        ],
      ),
    );
  }

  void setUpPasswordListener() {
    _passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowercase(_passwordController.text);
        hasUpperCase = AppRegex.hasUppercase(_passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(
          _passwordController.text,
        );
        hasANumber = AppRegex.hasNumber(_passwordController.text);
        atLeast8Charcter = AppRegex.isAtLeast8Characters(
          _passwordController.text,
        );
      });
    });
  }
}
