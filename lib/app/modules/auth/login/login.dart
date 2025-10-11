import 'package:flutter/material.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import 'widget/dont_have_an_account.dart';
import 'widget/email_and_password_login.dart';
import 'widget/or_sign_in_with.dart';
import 'widget/sign_in_type.dart';
import 'widget/terms_and_conditions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsetsDirectional.all(AppPadding.kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: getBoldTextStyle(
                    color: ColorManager.kPrimary,
                    fontSize: 25,
                  ),
                ),

              const  SizedBox(height:AppPadding.kPadding / 2),

                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in. ',
                  style: getBoldTextStyle(color: ColorManager.greyColor,fontSize: FontSizeManager.fs14),
                ),
               const SizedBox(height:AppPadding.kPadding * 1.5),

                const  EmailAndPasswordLogin(),


                const SizedBox(height:AppPadding.kPadding ),



                const  OrSignInWith(),

                const SizedBox(height:AppPadding.kPadding * 1.5),


                const   SignInType(),

                const SizedBox(height:AppPadding.kPadding * 2),

                const   TermsAndConditions(),
                const SizedBox(height:AppPadding.kPadding),
                const DontHaveAnAccount()




              ],
            ),
          ),
        ),
      ),
    );
  }
}
