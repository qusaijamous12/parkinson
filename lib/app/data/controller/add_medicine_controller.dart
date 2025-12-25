import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/helper/notification_service.dart';
import '../../shared/utils/utils.dart';

class AddMedicineController extends GetxController {
  final String uid;

  AddMedicineController({required this.uid});

  final medicineNameController = TextEditingController();
  final dosageController = TextEditingController();
  final _firebaseFireStore = FirebaseFirestore.instance;
  final selectedTime = Rxn<TimeOfDay>();

  Future<void> scheduleNotification() async {
    if (medicineNameController.text.isEmpty || selectedTime.value == null) {
      Utils.showToast(
        title: 'please_fill_fields'.tr,
        type: ToastificationType.info,
      );
      return;
    }

    final now = DateTime.now();

    DateTime scheduledDate = DateTime(
      now.year,
      now.month,
      now.day,
      selectedTime.value!.hour,
      selectedTime.value!.minute,
    );

    if (scheduledDate.isBefore(now.add(const Duration(minutes: 1)))) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    await NotificationService.scheduleNotification(
      title: medicineNameController.text,
      body: '${'time_to_take'.tr} ${medicineNameController.text}',
      scheduledTime: scheduledDate,
    );

    Utils.showToast(
      title: 'medicine_reminder_scheduled'.tr,
      type: ToastificationType.success,
    );
    final formattedDateTime = DateFormat('yyyy-MM-dd – HH:mm').format(scheduledDate);

    _firebaseFireStore.collection('users').doc(uid).collection('my_drugs').add({
      'medicine_name': medicineNameController.text,
      'dosage': dosageController.text,
      'time': formattedDateTime,
    });
  }

  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorManager.kPrimary,
              onPrimary: Colors.white,
              surface: Colors.grey.shade200,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: ColorManager.kPrimary,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (time != null) {
      selectedTime(time);
    }
  }

  @override
  void dispose() {
    medicineNameController.dispose();
    dosageController.dispose();
    super.dispose();
  }
}
