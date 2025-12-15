import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/contstant/color_manager.dart';
import '../../../../shared/contstant/style_manager.dart';
import '../../../../shared/contstant/values_manager.dart';

class PasswordTerms extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacter;
  final bool hasANumber;
  final bool atLeast8Charcter;




  const PasswordTerms({super.key, required this.hasLowerCase,required this.hasUpperCase,required this.hasSpecialCharacter,required this.hasANumber,required this.atLeast8Charcter});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppPadding.kPadding/4,
      children: [
        buildPasswordTermsRow(title: 'lowercase_letter', passwordCase:hasLowerCase),
        buildPasswordTermsRow(title: 'uppercase_letter', passwordCase:hasUpperCase),
        buildPasswordTermsRow(title: 'least_special_character', passwordCase:hasSpecialCharacter),
        buildPasswordTermsRow(title: 'number', passwordCase:hasANumber),
        buildPasswordTermsRow(title: 'character_long', passwordCase:atLeast8Charcter),

      ],
    );
  }

  Widget buildPasswordTermsRow({required String title, required bool passwordCase}) =>
      Row(
        spacing: AppPadding.kPadding / 4,
        children: [
          const CircleAvatar(
            radius: 3,
            backgroundColor: ColorManager.greyColor,
          ),

          Text(
            title.tr,
            style: getRegulerTextStyle(
                color: Colors.black,
                fontSize: FontSizeManager.fs14,
                textDecoration:passwordCase? TextDecoration.lineThrough:null,
                decorationColor: passwordCase?ColorManager.kPrimary:Colors.transparent),
          )
        ],
      );
}
