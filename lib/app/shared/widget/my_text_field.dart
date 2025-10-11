import 'package:flutter/material.dart';

import '../contstant/color_manager.dart';
import '../contstant/style_manager.dart';
import '../contstant/values_manager.dart';


class MyTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool ?obsecureText;
  final Widget ?suffixIcon;
  final String? Function(String?)? validate;

  const MyTextField({super.key,required this.hintText,required this.textInputType,required this.controller,this.obsecureText,this.suffixIcon,this.validate});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ColorManager.kPrimary,
          selectionColor: ColorManager.kPrimary.withValues(alpha: 0.3),
          selectionHandleColor: ColorManager.kPrimary
        )
      ),
      child: TextFormField  (
        controller:controller ,
        keyboardType:textInputType ,
        obscureText: obsecureText??false,
        decoration: InputDecoration(
            isDense: true,
            contentPadding:const EdgeInsetsDirectional.all( AppPadding.kPadding),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.kPrimary,
              ),
              borderRadius: BorderRadius.circular(AppPadding.kPadding/2),

            ),
            enabledBorder: OutlineInputBorder(
              borderSide:const BorderSide(
                color: ColorManager.greyColor,
              ),
              borderRadius: BorderRadius.circular(AppPadding.kPadding/2),

            ),
            errorBorder: OutlineInputBorder(
              borderSide:const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(AppPadding.kPadding/2),

            ),
            focusedErrorBorder:OutlineInputBorder(
              borderSide:const BorderSide(
                color: Colors.red,
              ),
              borderRadius: BorderRadius.circular(AppPadding.kPadding/2),

            ) ,

            suffixIcon:suffixIcon??const SizedBox() ,
            hintText: hintText,
            hintStyle: getRegulerTextStyle(color: ColorManager.greyColor)

        ),
        validator:validate,
        style: getMediumTextStyle(color: Colors.black),
      ),
    );
  }
}
