import 'package:flutter/material.dart';

import '../contstant/color_manager.dart';
import '../contstant/style_manager.dart';

class MyLoading extends StatelessWidget {
  const MyLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        margin:const EdgeInsetsDirectional.only(top: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
             CircularProgressIndicator(color: ColorManager.kPrimary,),
            const SizedBox(width: 20),
            Text('Loading...',style:getMediumTextStyle(color: Colors.black) ,),
          ],
        ),
      ),
    );
  }
}