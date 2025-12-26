import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/controller/home_controller.dart';
import '../../../../data/enum/data_status.dart';
import 'populer_doctors_loading.dart';
import 'populer_doctors_success.dart';

class PopulerDoctorsWidget extends StatelessWidget {
  const PopulerDoctorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _home=Get.find<HomeController>(tag: 'home_controller');
    return Obx((){
      if(_home.getDoctorsStatus.value==ApiStatus.loading)
        return const PopulerDoctorsLoading();
      else if(_home.getDoctorsStatus.value==ApiStatus.success)
        return const PopulerDoctorsSuccessWidget();
      else
        return const SizedBox();
    });
  }
}
