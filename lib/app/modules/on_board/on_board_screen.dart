import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/widget/my_button.dart';
import '../auth/login/login.dart';
import 'widgets/doc_image_and_name.dart';
import 'widgets/doctor_with_shadow.dart';
import 'widgets/title_and_subtitle.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding:const  EdgeInsetsDirectional.only(
            top: AppPadding.kPadding*2,
            start: AppPadding.kPadding,
            end: AppPadding.kPadding,
            bottom: AppPadding.kPadding,
          ),
          child: Column(
        
            children: [
              const DocImageAndName(),
             const SizedBox(
                height: AppPadding.kPadding*3,
              ),
              const DoctorWithShadow(),
        
              const TitleAndSubtitle(),
             const SizedBox(
                height: AppPadding.kPadding*2,
              ),
              MyBtn(onTap: (){
                Get.to(()=>const LoginScreen());
              }, title: 'Get Started')
        
            ],
          ),
        ),
      ),
    );
  }
}
