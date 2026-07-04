import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controller/app_controller.dart';
import '../data/controller/binding/home_binding.dart';
import '../data/controller/user_controller.dart';
import '../routes/route_manager.dart';
import '../shared/contstant/image_manager.dart';
import 'home_screen/home_screen.dart';
import 'home_screen_doctor/home_screen_doctor.dart';
import 'on_board/on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _app=Get.find<AppController>(tag: 'app_controller');
  final _user=Get.find<UserController>(tag: 'user_controller');

  Timer ?_timer;

  void _onStart(){
    _timer=Timer(const Duration(seconds: 3), _onFinish);
  }
  void _onFinish(){
    if(_app.isLoggedIn){
      if(_user.userModel?.userType=='user')
      RouteManager.offAll(const HomeScreen(),bindings: HomeBinding());
      else
      RouteManager.offAll(const HomeScreenDoctor(),bindings: HomeBinding());
    }
    else
    RouteManager.offAll(const OnBoardScreen());
  }


  @override
  void initState() {
    _onStart();
    super.initState();
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: Center(child: Image.asset('assets/images/splash_image.png')),
        ),
      ),
    );
  }
}
