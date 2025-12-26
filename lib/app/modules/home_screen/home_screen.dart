import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controller/app_controller.dart';
import '../../data/controller/home_controller.dart';
import '../../shared/contstant/values_manager.dart';
import 'floating_action_btn/index.dart';
import 'widget/app_bar_home.dart';
import 'drawer/drawer_home_screen.dart';
import 'widget/chat_with_doctors/index.dart';
import 'widget/chat_with_doctors/success.dart';
import 'widget/our_services_widget.dart';
import 'widget/populer_doctors/index.dart';
import 'widget/populer_doctors/populer_doctors_loading.dart';
import 'widget/populer_doctors/populer_doctors_success.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _key=GlobalKey<ScaffoldState>();
    final _home=Get.find<HomeController>(tag: 'home_controller');
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
                const  ChatWithDoctors(),
                const   OurServicesWidget(),
                const  PopulerDoctorsWidget(),
              ],
            ),
          ),
          floatingActionButton:const FloatingActionBtnHome(),
        ),
      ),
    );
  }
}
