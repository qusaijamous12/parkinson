import 'dart:ui';

import 'package:get/get.dart';

import '../../modules/home_screen/home_screen.dart';
import '../../modules/list_chat_screen/list_chat_screen.dart';
import '../../modules/profile_screen/profile_screen.dart';
import '../../shared/utils/utils.dart';

class AppController extends GetxController{

  void changeLanguage(){

    if(Get.locale?.languageCode=='ar'){
      Utils.printLog('HERE!');
      Get.updateLocale(const Locale('en'));
    }
    else
      Get.updateLocale(const Locale('ar'));
  }

}