import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'app/shared/helper/notification_service.dart';
import 'app/shared/helper/shared_pref_helper.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await SharedPrefHelper.init();
  await NotificationService.initializeNotification();


  runApp(const MyApp());
}


