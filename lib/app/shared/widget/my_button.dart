import 'package:flutter/material.dart';
import '../contstant/color_manager.dart';
import '../contstant/style_manager.dart';
import '../contstant/values_manager.dart';

class MyBtn extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color? btnColor;
  final Color? txtColor;
  final Color? btnBorderColor;
  final bool fullWidth;
  final bool enabled;

  const MyBtn({
    super.key,
    required this.title,
    required this.onTap,
    this.btnColor,
    this.txtColor,
    this.btnBorderColor,
    this.fullWidth = false,
    this.enabled=true
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:enabled? onTap:(){},
      borderRadius: const BorderRadius.all(
        Radius.circular(AppPadding.kPadding * 1.5),
      ),
      child: Container(
        width: fullWidth ? double.infinity : 200,
        alignment: AlignmentDirectional.center,
        height: 53,
        padding: const EdgeInsetsDirectional.symmetric(
          vertical: AppPadding.kPadding / 2,
          horizontal: AppPadding.kPadding,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(
            AppPadding.kPadding * 1.5,
          ),
          color:enabled? (btnColor ?? ColorManager.kPrimary):(btnColor ?? ColorManager.kPrimary.withValues(alpha: 0.3)),
          border: Border.all(color:enabled? (btnBorderColor ?? Colors.white):(btnBorderColor?.withValues(alpha: 0.3) ?? Colors.white)),
        ),
        child: Text(
          title,
          style: getBoldTextStyle(
            color: txtColor ?? Colors.white,
            fontSize: FontSizeManager.fs16,
          ),
        ),
      ),
    );
  }
}
