import 'package:get/get.dart';

import '../add_medicine_controller.dart';

class AddMedicineBinding extends Bindings{
  final String uid;
  AddMedicineBinding({required this.uid});
  @override
  void dependencies() {
    Get.put<AddMedicineController>(AddMedicineController(uid: uid),tag: 'add_medicine_controller');
  }

}