import 'dart:ui';
import 'package:get/get.dart';
import '../../shared/helper/shared_pref_helper.dart';
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



  bool get isLoggedIn=>SharedPrefHelper.getBool(key: 'logged_in')??false;


}