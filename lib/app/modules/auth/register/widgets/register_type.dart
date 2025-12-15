import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../data/controller/login_controller.dart';
import '../../../../shared/contstant/image_manager.dart';
import '../../../../shared/contstant/values_manager.dart';

class RegisterType extends StatelessWidget {
  const RegisterType({super.key});

  @override
  Widget build(BuildContext context) {
    final _userController=Get.find<UserController>(tag: 'user_controller');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: ()async{
              await _userController.signInWithGoogle();
            },
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding:const EdgeInsetsDirectional.all(AppPadding.kPadding/3),
              decoration:const BoxDecoration(
                shape: BoxShape.circle,
                color:Color(0xffF5F5F5),

              ),
              child: Image.asset(IconManager.googleIcon,height: 30,),
            ),
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
