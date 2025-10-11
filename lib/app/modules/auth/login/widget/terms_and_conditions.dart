import 'package:flutter/material.dart';
import '../../../../shared/contstant/color_manager.dart';
import '../../../../shared/contstant/style_manager.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return    RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            children: [
              TextSpan(
                  text: 'By logging, you agree to our',
                  style: getRegulerTextStyle(color: ColorManager.lightGrey,fontSize: 14)
              ),
              TextSpan(
                  text: ' Terms & Conditions',
                  style: getRegulerTextStyle(color: Colors.black,fontSize: 14)
              ),
              TextSpan(
                  text: ' and',
                  style: getRegulerTextStyle(color: ColorManager.lightGrey,fontSize: 14)
              ),
              TextSpan(
                  text: ' PrivacyPolicy.',
                  style: getRegulerTextStyle(color: Colors.black,fontSize: 14)
              ),
            ]
        ));
  }
}
