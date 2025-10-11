import 'package:get/get.dart';
import 'package:flutter/material.dart';


class RouteManager {
  static Future<T?> to<T>(Widget page, {bool fullscreenDialog = false}) async{
    return Get.to<T>(
      () => page,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
      fullscreenDialog: fullscreenDialog,
    );
  }


  static void back<T>({T? result}) {
    if (Get.isOverlaysOpen) Get.back(result: result);
  }

  static Future<T?> offAll<T>(Widget page) async {
    return Get.offAll<T>(
          () => page,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
    );
  }

  static Future<T?> off<T>(Widget page) async {
    return Get.off<T>(
          () => page,
      transition: Transition.rightToLeft,
      duration: const Duration(milliseconds: 300),
    );
  }
}
