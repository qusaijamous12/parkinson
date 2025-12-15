import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controller/app_controller.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/style_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widget/my_button.dart';
import '../auth/login/login.dart';
import 'widgets/doc_image_and_name.dart';
import 'widgets/doctor_with_shadow.dart';
import 'widgets/title_and_subtitle.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _appController=Get.find<AppController>(tag: 'app_controller');
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PopupMenuButton<String>(
                    padding: EdgeInsetsDirectional.zero,
                    onSelected: (value) {
                      _appController.changeLanguage();
                    },
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 'arabic',
                        child: Text(
                          'arabic'.tr,
                          style: getRegulerTextStyle(color: Colors.black,fontSize: FontSizeManager.fs12),
                        ),
                      ),
                      PopupMenuItem(
                        value: 'english',
                        child: Text(
                          'english'.tr,
                          style: getRegulerTextStyle(color: Colors.black,fontSize: FontSizeManager.fs12),
                        ),
                      ),

                    ],
                    child: Row(
                      spacing: AppPadding.kPadding/2,
                      children: [
                        Icon(Icons.language,color: ColorManager.kPrimary,),
                        Text(
                          'language'.tr,
                          style: getMediumTextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    color: Colors.white,
                  ),


                ],
              ),
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
              }, title: 'get_started'.tr)

            ],
          ),
        ),
      ),
    );
  }
}
