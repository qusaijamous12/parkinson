import 'package:get/get.dart';

import '../app_controller.dart';
import '../login_controller.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AppController(),tag: 'app_controller');
    Get.put(UserController(),tag: 'user_controller');
  }

}