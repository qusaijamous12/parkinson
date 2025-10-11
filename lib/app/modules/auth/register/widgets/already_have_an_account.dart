import 'package:flutter/material.dart';

import '../../../../shared/contstant/color_manager.dart';
import '../../../../shared/contstant/style_manager.dart';


class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account yet?',
          style: getRegulerTextStyle(color: Colors.black),
        ),
        TextButton(onPressed: (){
        }, child: Text(
          'Sign In',
          style: getRegulerTextStyle(color: ColorManager.kPrimary),
        ))
      ],
    );
  }
}
