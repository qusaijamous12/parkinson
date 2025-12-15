import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';
import 'app/data/controller/binding/intial_binding.dart';
import 'app/modules/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/shared/strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ToastificationWrapper(
      child: GetMaterialApp(
        initialBinding: InitialBinding(),
        debugShowCheckedModeBanner: false,
        fallbackLocale: const Locale('en'),
        localizationsDelegates:const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        locale:const Locale('en'),
        translations:  Strings(),
        theme:ThemeData(
          scaffoldBackgroundColor: Colors.white
        ),
        home:const SplashScreen(),
      ),
    );
  }
}