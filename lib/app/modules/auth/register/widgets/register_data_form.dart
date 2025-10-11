import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/controller/login_controller.dart';
import '../../../../shared/contstant/color_manager.dart';
import '../../../../shared/helper/app_regx.dart';
import '../../../../shared/utils/text_utils.dart';
import '../../../../shared/widget/my_button.dart';
import '../../../../shared/widget/my_text_field.dart';
import '../../login/widget/password_terms.dart';


class RegisterDataForm extends StatefulWidget {
  const RegisterDataForm({super.key});

  @override
  State<RegisterDataForm> createState() => _RegisterDataFormState();
}

class _RegisterDataFormState extends State<RegisterDataForm> {
  final _formKey = GlobalKey<FormState>();
  bool isObsecure = false;
  final passwordController = TextEditingController();
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasANumber = false;
  bool atLeast8Charcter = false;
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _userController = Get.find<UserController>(tag: 'user_controller');
  final _selectedGender=RxString('Male');

  @override
  void initState() {
    super.initState();
    setUpPasswordListener();
  }

  @override
  void dispose() {
    passwordController.dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          MyTextField(
            hintText: 'name',
            textInputType: TextInputType.text,
            controller: nameController,
            validate: (value) {
              if (TextUtils.isEmpty(value)) {
                return 'Name is Required';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          MyTextField(
            hintText: 'email',
            textInputType: TextInputType.emailAddress,
            controller: emailController,
            validate: (value) {
              if (AppRegex.isValidEmail(emailController.text)) {
                return null;
              } else {
                return 'Please enter validate email';
              }
            },
          ),
          const SizedBox(height: 10),
          MyTextField(
            hintText: 'phone',
            textInputType: TextInputType.phone,
            controller: phoneController,
            validate: (value) {
              if (TextUtils.isEmpty(value)) {
                return 'Phone is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          Obx(()=>Container(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: ColorManager.greyColor
                )
            ),
            child: DropdownButton<String>(
              dropdownColor: Colors.white,

              value: _selectedGender.value,
              style:const TextStyle(
                  color: Colors.black
              ),
              hint: const Text(
                'Select Gender',
                style: TextStyle(color: Colors.black),
              ),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
              isExpanded: true,
              underline: Container(),
              items: ['Male', 'Female'].map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(
                    gender,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                _selectedGender(newValue);
              },
            ),
          )),

          const SizedBox(height: 10),
          MyTextField(
            hintText: 'password',
            textInputType: TextInputType.phone,
            controller: passwordController,
            validate: (value) {
              if (hasLowerCase &&
                  hasUpperCase &&
                  hasSpecialCharacter &&
                  hasANumber &&
                  atLeast8Charcter) {
                return null;
              }
              return 'Please follow the password terms';
            },
          ),
          const SizedBox(height: 10),
          MyTextField(
            hintText: 'confirm password',
            textInputType: TextInputType.phone,
            controller: confirmPasswordController,
            validate: (value) {
              if (passwordController.text == confirmPasswordController.text) {
                return null;
              }
              return 'The confirm password must be like password';
            },
          ),


          const SizedBox(height: 10),
          PasswordTerms(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacter: hasSpecialCharacter,
            hasANumber: hasANumber,
            atLeast8Charcter: atLeast8Charcter,
          ),

          const SizedBox(height: 20),
          MyBtn(
            onTap: () async {
              // if(_formKey.currentState?.validate()??false){
              //   await _userController.createAccount(
              //       email:emailController.text ,
              //       name: nameController.text,
              //       password: passwordController.text,
              //       phoneNumber: phoneController.text,
              //       gender: 'Male');
              // }

            },
            title: 'Register',
          ),
        ],
      ),
    );
  }

  void setUpPasswordListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowercase(passwordController.text);
        hasUpperCase = AppRegex.hasUppercase(passwordController.text);
        hasSpecialCharacter = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasANumber = AppRegex.hasNumber(passwordController.text);
        atLeast8Charcter = AppRegex.isAtLeast8Characters(
          passwordController.text,
        );
      });
    });
  }
}
