import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';
import 'app/data/controller/app_controller.dart';
import 'app/data/controller/login_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AppController(),tag: 'app_controller');
  Get.put(UserController(),tag: 'user_controller');
  runApp(const MyApp());
}


