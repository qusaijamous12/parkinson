import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/contstant/color_manager.dart';
import '../../../../shared/contstant/style_manager.dart';
import '../../../../shared/contstant/values_manager.dart';
import '../../../../shared/helper/app_regx.dart';
import '../../../../shared/widget/my_button.dart';
import '../../../../shared/widget/my_text_field.dart';
import 'password_terms.dart';


class EmailAndPasswordLogin extends StatefulWidget {
  const EmailAndPasswordLogin({super.key});

  @override
  State<EmailAndPasswordLogin> createState() => _EmailAndPasswordLoginState();
}

class _EmailAndPasswordLoginState extends State<EmailAndPasswordLogin> {
  final _emailController=TextEditingController();
  bool isObsecure = false;
  late TextEditingController _passwordController;
  bool hasLowerCase=false;
  bool hasUpperCase=false;
  bool hasSpecialCharacter=false;
  bool hasANumber=false;
  bool atLeast8Charcter=false;


  @override
  void initState() {
    super.initState();
    _passwordController=TextEditingController();
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
      child: Column(
        children: [
          MyTextField(
            hintText: 'Email',
            textInputType: TextInputType.emailAddress,
            controller: _emailController,
            validate: (value){
              // if(value==null || value.isEmpty || !AppRegex.isValidEmail(value)){
              //   return 'Please enter a valid email';
              // }
              // return null;
            },
          ),
          const SizedBox(height: AppPadding.kPadding),
          MyTextField(
            hintText: 'Password',
            textInputType: TextInputType.emailAddress,
            controller: _passwordController,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObsecure = !isObsecure;
                });
              },
              child: Icon(
                isObsecure
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),
            ),
            obsecureText: isObsecure,
            validate: (value){
              if(hasLowerCase && hasUpperCase &&hasSpecialCharacter &&hasANumber && atLeast8Charcter){

                return null;

              }else{
                return 'Please follow the password terms';
              }
            },
          ),
         const SizedBox(height:AppPadding.kPadding / 2),
          PasswordTerms(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacter: hasSpecialCharacter,
            hasANumber: hasANumber,
            atLeast8Charcter: atLeast8Charcter,
          ),

          const SizedBox(height:AppPadding.kPadding),


          Align(
            alignment: AlignmentDirectional.topEnd,
            child: TextButton(onPressed: (){

            }, child: Text(
              'Forgot Password?',
              style: getMediumTextStyle(color: ColorManager.kPrimary),
            )),
          ),

          const SizedBox(height:AppPadding.kPadding),


          MyBtn(onTap: ()async{
            // if(context.read<LoginCubit>().formKey.currentState!.validate()){
            //   await context.read<LoginCubit>().login(loginRequest: LoginRequest(email: context.read<LoginCubit>().emailController.text, password: _passwordController.text));
            //
            // }


          }, title: 'Login'),

        ],
      ),
    );
  }

  void setUpPasswordListener(){
    _passwordController.addListener((){
      setState(() {
        hasLowerCase=AppRegex.hasLowercase(_passwordController.text);
        hasUpperCase=AppRegex.hasUppercase(_passwordController.text);
        hasSpecialCharacter=AppRegex.hasSpecialCharacter(_passwordController.text);
        hasANumber=AppRegex.hasNumber(_passwordController.text);
        atLeast8Charcter=AppRegex.isAtLeast8Characters(_passwordController.text);
      });
    });
  }
}
