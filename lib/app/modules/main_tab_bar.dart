import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controller/app_controller.dart';
import '../shared/contstant/color_manager.dart';
import '../shared/contstant/style_manager.dart';
import '../shared/contstant/values_manager.dart';

class MainTabBar extends StatefulWidget {
  const MainTabBar({super.key});

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  final _appController=Get.find<AppController>(tag: 'app_controller');



  @override
  Widget build(BuildContext context) {
    return Obx(()=>Container(
      color: ColorManager.kPrimary,
      child: SafeArea(
        bottom: false,
        child: Scaffold(
          body: _appController.screens[_appController.currentIndex.value],
          bottomNavigationBar: CircleNavBar(
            activeIndex: _appController.currentIndex.value,
            activeIcons:const  [
              Icon(Icons.home, color: Colors.white,),
              Icon(Icons.chat, color: Colors.white),
              Icon(Icons.person, color: Colors.white),
            ],
            inactiveIcons:  [
              Text('Home',style: getMediumTextStyle(color: ColorManager.kPrimary,fontSize: FontSizeManager.fs14),),
              Text('Chat',style: getMediumTextStyle(color: ColorManager.kPrimary,fontSize: FontSizeManager.fs14)),
              Text('Profile',style: getMediumTextStyle(color: ColorManager.kPrimary,fontSize: FontSizeManager.fs14)),
            ],
            color: Colors.white,
            circleColor: ColorManager.kPrimary,
            height: 60,
            circleWidth: 60,
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
            cornerRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
            ),
            onTap: (value){
              _appController.currentIndex(value);
            },
            shadowColor: Colors.black,
            elevation: 10,


          ),
        ),
      ),
    ));
  }
}
