

import 'package:flutter/cupertino.dart';

import 'values_manager.dart';


TextStyle _getAppTextStyle({
  required double fontSize,
  required Color color,
  required FontWeight font,
  TextDecoration? textDecoration,
  Color? decorationColor,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: AppFontFamily.appFontFamily,
    color: color,
    fontWeight: font,
    decoration: textDecoration,
    decorationColor: decorationColor,
  );
}

TextStyle getLightTextStyle({
  required Color color,
  double fontSize = FontSizeManager.fs14,
  FontWeight font = AppFontWeight.w300,
}) {
  return _getAppTextStyle(fontSize: fontSize, color: color, font: font);
}

TextStyle getRegulerTextStyle({
  required Color color,
  double fontSize = FontSizeManager.fs16,
  FontWeight font = AppFontWeight.w400,
  TextDecoration ?textDecoration,
  Color ?decorationColor
}) {
  return _getAppTextStyle(fontSize: fontSize, color: color, font: font,textDecoration: textDecoration,decorationColor: decorationColor);
}

TextStyle getMediumTextStyle({
  required Color color,
  double fontSize = FontSizeManager.fs18,
  FontWeight font = AppFontWeight.w500,
}) {
  return _getAppTextStyle(fontSize: fontSize, color: color, font: font);
}

TextStyle getSemiBoldTextStyle({
  required Color color,
  double fontSize = FontSizeManager.fs20,
  FontWeight font = AppFontWeight.w600,
}) {
  return _getAppTextStyle(fontSize: fontSize, color: color, font: font);
}

TextStyle getBoldTextStyle({
  required Color color,
  double fontSize = FontSizeManager.fs20,
  FontWeight font = AppFontWeight.w700,
}) {
  return _getAppTextStyle(fontSize: fontSize, color: color, font: font);
}
