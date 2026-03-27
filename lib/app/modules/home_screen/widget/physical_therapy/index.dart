import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/controller/home_controller.dart';
import '../../../../data/enum/data_status.dart';
import 'physical_therapy_loading.dart';
import 'physical_therapy_success.dart';

class PhysicalTherapyWidget extends StatelessWidget {
  const PhysicalTherapyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _home = Get.find<HomeController>(tag: 'home_controller');
    return Obx(() {
      if (_home.getDoctorsStatus.value == ApiStatus.loading) {
        return const PhysicalTherapyLoading();
      }

      if (_home.physicalTherapists.isEmpty) {
        return const SizedBox();
      }

      return const PhysicalTherapySuccessWidget();
    });
  }
}
