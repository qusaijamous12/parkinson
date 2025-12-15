import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../contstant/color_manager.dart';
import '../contstant/style_manager.dart';
import '../contstant/values_manager.dart';

class MyTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final String? Function(String?)? validate;
  final bool isPassword;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.controller,
    this.suffixIcon,
    this.validate,
    this.isPassword=false
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool showPassword=true;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorManager.kPrimary,
          selectionColor: ColorManager.kPrimary.withValues(alpha: 0.3),
          selectionHandleColor: ColorManager.kPrimary,
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        obscureText:widget.isPassword? showPassword:false,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsetsDirectional.all(AppPadding.kPadding),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManager.kPrimary),
            borderRadius: BorderRadius.circular(AppPadding.kPadding / 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: ColorManager.greyColor),
            borderRadius: BorderRadius.circular(AppPadding.kPadding / 2),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(AppPadding.kPadding / 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(AppPadding.kPadding / 2),
          ),

          suffixIcon:widget.isPassword?GestureDetector(
              onTap: (){
                setState(() {
                  showPassword=!showPassword;
                });
              },
              child: Icon(
                  showPassword?
                  Icons.visibility_off_outlined:Icons.remove_red_eye_outlined)): widget.suffixIcon,
          hintText: widget.hintText,
          hintStyle: getRegulerTextStyle(color: ColorManager.greyColor),
        ),
        validator: widget.validate,
        style: getMediumTextStyle(color: Colors.black),
      ),
    );
  }
}
