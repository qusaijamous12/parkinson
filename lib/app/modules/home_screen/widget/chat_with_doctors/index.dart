import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/controller/home_controller.dart';
import '../../../../data/enum/data_status.dart';
import 'loading.dart';
import 'success.dart';

class ChatWithDoctors extends StatelessWidget {
  const ChatWithDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    final _home=Get.find<HomeController>(tag: 'home_controller');
    return Obx((){
      if(_home.getDoctorsStatus.value==ApiStatus.success)
        return const SuccessChatWithDoctors();
      else if(_home.getDoctorsStatus.value==ApiStatus.loading)
        return const ChatWithDoctorsLoading();
      else
        return const SizedBox();
    });
  }
}
