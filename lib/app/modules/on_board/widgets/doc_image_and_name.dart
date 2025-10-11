
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/contstant/image_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';

class DocImageAndName extends StatelessWidget {
  const DocImageAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.symmetric(vertical: AppPadding.kPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: AppPadding.kPadding/2,
        children: [

          SvgPicture.asset(SvgManager.docLogo),
          Text(
            'Parkinson',
            style:getMediumTextStyle(fontSize: 25, color: Colors.black),


          ),


        ],
      ),
    );
  }
}
