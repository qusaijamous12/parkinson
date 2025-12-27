import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

import '../../shared/utils/text_utils.dart';
import '../../shared/utils/utils.dart';
import '../enum/data_status.dart';
import '../model/user_model.dart';
import 'user_controller.dart';

class AppointmentController extends GetxController {
  final UserModel model;
  final UserController userController;

  AppointmentController(this.model, this.userController);

  final _firebaseInstance = FirebaseFirestore.instance;
  final patientName = TextEditingController();
  final contactNumber = TextEditingController();
  final selectedDate = Rxn<DateTime>();
  final selectedTime = RxnString();

  final List<String> timeSlots = [
    '09:00 AM',
    '10:00 AM',
    '11:00 AM',
    '01:00 PM',
    '02:00 PM',
    '03:00 PM',
  ];
  final confirmApiStatus=Rx<ApiStatus>(ApiStatus.initial);




  Future<void> confirmAppointment() async {
    try {
      if (TextUtils.isEmpty(patientName.text)) {
        Utils.showToast(
          title: 'name_is_required'.tr,
          type: ToastificationType.info,
        );
        return;
      }
      if (TextUtils.isEmpty(contactNumber.text)) {
        Utils.showToast(
          title: 'contact_number_required'.tr,
          type: ToastificationType.info,
        );
        return;
      }
      if (selectedDate.value == null) {
        Utils.showToast(
          title: 'please_select_date'.tr,
          type: ToastificationType.info,
        );
        return;
      }

      if (selectedTime.value == null) {
        Utils.showToast(
          title: 'please_select_time'.tr,
          type: ToastificationType.info,
        );
        return;
      }
      confirmApiStatus(ApiStatus.loading);

      final result = await _firebaseInstance
          .collection('users')
          .doc(model.uid)
          .collection('my_appointments')
          .doc(userController.userModel?.uid)
          .set({
            'patient_name': patientName.text,
            'contact_number': contactNumber.text,
            'date': selectedDate.value,
            'time': selectedTime.value,
            'patient_uid': userController.userModel?.uid,
            'status': 'pending',
          });

      confirmApiStatus(ApiStatus.success);
      Utils.showToast(title: 'appointment_booked_successfully'.tr, type: ToastificationType.success);


    } catch (error) {
      Utils.printLog('Error When Confirm Appointment ${error.toString()}');
      confirmApiStatus(ApiStatus.failure);

    }
  }
}
