import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controller/app_controller.dart';
import '../../shared/contstant/values_manager.dart';
import 'widget/app_bar_home/index.dart';
import 'widget/app_bar_home/widget/drawer_home_screen.dart';
import 'widget/chat_with_doctor_widget.dart';
import 'widget/our_services_widget.dart';
import 'widget/populer_doctors_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _key=GlobalKey<ScaffoldState>();
    final _appController=Get.find<AppController>(tag: 'app_controller');
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          key: _key,
          drawer:const DrawerHomeScreen(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppPadding.kPadding,
              children: [
                 AppBarHome(
                   onTapLanguage: ()=>_appController.changeLanguage(),
                   onTapMenu: ()=>_key.currentState!.openDrawer(),
                 ),
                const   ChatWithDoctorWidget(),
                const   OurServicesWidget(),
                const  PopulerDoctorsWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
