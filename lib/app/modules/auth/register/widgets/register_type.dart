import 'package:flutter/cupertino.dart';
import '../../../../shared/contstant/image_manager.dart';
import '../../../../shared/contstant/values_manager.dart';

class RegisterType extends StatelessWidget {
  const RegisterType({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding:const EdgeInsetsDirectional.all(AppPadding.kPadding/3),
            decoration:const BoxDecoration(
              shape: BoxShape.circle,
              color:Color(0xffF5F5F5),

            ),
            child: Image.asset(IconManager.googleIcon,height: 30,),
          ),
        ),
        Expanded(
          child: Container(
            padding:const EdgeInsetsDirectional.all(AppPadding.kPadding/3),
            decoration:const BoxDecoration(
              shape: BoxShape.circle,
              color:Color(0xffF5F5F5),

            ),
            child: Image.asset(IconManager.facebookIcon,height: 30,),
          ),
        ),
        Expanded(
          child: Container(
            padding:const EdgeInsetsDirectional.all(AppPadding.kPadding/3),
            decoration:const BoxDecoration(
              shape: BoxShape.circle,
              color:Color(0xffF5F5F5),

            ),
            child: Image.asset(IconManager.appleIcon,height: 30,),
          ),
        )

      ],
    );
  }
}
