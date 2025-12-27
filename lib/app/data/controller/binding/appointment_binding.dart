import 'package:get/get.dart';

import '../../model/user_model.dart';
import '../appointment_controller.dart';
import '../user_controller.dart';

class AppointmentBinding extends Bindings{
  final UserModel model;

  AppointmentBinding(this.model);
  @override
  void dependencies() {
    Get.put<AppointmentController>(AppointmentController(model,Get.find<UserController>(tag: 'user_controller')),tag: 'appointment_controller');
  }

}