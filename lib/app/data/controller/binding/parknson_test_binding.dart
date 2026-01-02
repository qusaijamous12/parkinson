import 'package:get/get.dart';

import '../parknson_test_controller.dart';

class ParknsonTestBinding extends Bindings{
  @override
  void dependencies() {
    Get.put<ParknsonTestController>(ParknsonTestController(),tag: 'parknson_test_controller');
  }

}