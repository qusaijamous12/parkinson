import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/modules/main_tab_bar.dart';
import 'app/modules/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      home:const SplashScreen(),
    );
  }
}