import 'package:flutter/material.dart';

import '../contstant/color_manager.dart';
import '../contstant/values_manager.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsetsDirectional.symmetric(vertical: AppPadding.kPadding/2),
      child:  Divider(color: ColorManager.greyTextLogin,),
    );
  }
}
