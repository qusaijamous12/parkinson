import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../contstant/style_manager.dart';

class Utils{

  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void printLog(Object? message) {
    if(kDebugMode)
    debugPrint('🔹 $message');
  }

  static ToastificationItem showToast({required final String title,required final ToastificationType type}){
    return toastification.show(
      type: type,
      style: ToastificationStyle.fillColored,
      autoCloseDuration: const Duration(seconds: 3),
      title: Container(
          margin:const EdgeInsetsDirectional.only(top: 8),
          child: Text('$title',style: getMediumTextStyle(color: Colors.black),)),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      icon:  Icon(type==ToastificationType.success?Icons.check_circle:Icons.error,color:
      type==ToastificationType.success?Colors.green:Colors.red,),
      showIcon: true,
      primaryColor: Colors.white,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: true,
      closeButton: ToastCloseButton(
        showType: CloseButtonShowType.onHover,
        buttonBuilder: (context, onClose) {
          return OutlinedButton.icon(
            onPressed: onClose,
            icon: const Icon(Icons.close, size: 20),
            label: const Text('Close'),
          );
        },
      ),
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
    );
}





}