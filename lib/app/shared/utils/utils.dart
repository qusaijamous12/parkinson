import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:motion_toast/motion_toast.dart';

class Utils{

  static void printLog(Object? message) {
    if(kDebugMode)
    debugPrint('🔹 $message');
  }

static void errorToast(){
    return MotionToast.error(
        title:  Text('Error'),
        description:  Text('Please enter your name')
    ).show(Get.context!);
}

static void successToast(){
    return MotionToast.success(
      title:  Text('Success Motion Toast'),
      description:  Text('Example of success motion toast'),
    ).show(Get.context!);
}

}