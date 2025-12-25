import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../data/controller/user_controller.dart';
import '../../data/enum/data_status.dart';
import '../../routes/route_manager.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/style_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/utils/text_utils.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widget/my_button.dart';
import '../../shared/widget/my_loading.dart';
import '../../shared/widget/my_text_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _emailController = TextEditingController();
  final _userController = Get.find<UserController>(tag: 'user_controller');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.closeKeyboard(),
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: LoadingOverlay(
            isLoading:
                _userController.forgetPasswordStatus.value == ApiStatus.loading,
            child: Scaffold(
              body: Padding(
                padding: const EdgeInsetsDirectional.all(AppPadding.kPadding),
                child: Form(
                  key: _formKey,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                      const SizedBox(height: AppPadding.kPadding),
                      Text(
                        'Forget Password',
                        style: getBoldTextStyle(color: Colors.black, fontSize: 25),
                      ),
                      const SizedBox(height: AppPadding.kPadding / 2),
                      Text(
                        'Enter your email to reset your password.',
                        style: getRegulerTextStyle(
                          color: ColorManager.greyColor,
                          fontSize: FontSizeManager.fs14,
                        ),
                      ),
                      const SizedBox(height: AppPadding.kPadding * 1.5),
                      MyTextField(
                        hintText: 'Email Address',
                        textInputType: TextInputType.emailAddress,
                        controller: _emailController,
                        validate: (value){
                          if(TextUtils.isEmpty(value))
                            return 'Email Is Required';
                          return null;
                        },
                      ),
                      const Spacer(),
                      MyBtn(title: 'Continue',fullWidth: true, onTap: ()async{
                        if(_formKey.currentState?.validate()??false)
                          await _userController.forgetPassword(email: _emailController.text);

                      },)
                    ],
                  ),
                ),
              ),
            ),
            progressIndicator:const MyLoading(),
          ),
        ),
      ),
    );
  }
}
