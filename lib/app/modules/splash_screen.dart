import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../routes/route_manager.dart';
import '../shared/contstant/image_manager.dart';
import 'on_board/on_board_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer ?_timer;

  void _onStart(){
    _timer=Timer(const Duration(seconds: 3), _onFinish);
  }
  void _onFinish(){
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
    return Scaffold(
      body: Image.asset(ImageManager.splashImage),
    );
  }
}
