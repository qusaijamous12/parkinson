import 'package:flutter/material.dart';

import '../contstant/color_manager.dart';
import '../contstant/style_manager.dart';
import '../contstant/values_manager.dart';

class SearchTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final String? Function(String?)? validate;
  final bool isPassword;

  const SearchTextField({
    super.key,

    required this.hintText,
    required this.textInputType,
    required this.controller,
    this.suffixIcon,
    this.validate,
    this.isPassword = false,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {

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
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: Colors.white,
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
          constraints:const BoxConstraints(
            maxHeight: 50,
            minHeight: 50
          ),
          prefixIcon: Container(
              margin:const EdgeInsetsDirectional.only(bottom: 3),
              child: const Icon(Icons.search,size: 25,)),
          suffixIcon:const Icon(Icons.close,size: 25,),

          hintText: widget.hintText,
          hintStyle: getRegulerTextStyle(color: ColorManager.greyColor),
        ),
        validator: widget.validate,
        style: getMediumTextStyle(color: Colors.black),
      ),
    );
  }
}
