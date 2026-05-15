import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../data/controller/user_controller.dart';
import '../../data/enum/data_status.dart';
import '../../data/model/medicine_model.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/widget/app_bar.dart';
import '../../shared/widget/my_loading.dart';
import 'widgets/medicine_cell.dart';
import 'widgets/no_medicines_cell.dart';

class MyMedicinesScreen extends StatefulWidget {
  const MyMedicinesScreen({super.key});

  @override
  State<MyMedicinesScreen> createState() => _MyMedicinesScreenState();
}

class _MyMedicinesScreenState extends State<MyMedicinesScreen> {
  final _user = Get.find<UserController>(tag: 'user_controller');

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _user.getMyMedicines();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => LoadingOverlay(
          isLoading: _user.getMyMedicinesApiStatus.value == ApiStatus.loading,
          progressIndicator: const MyLoading(),
          child: Column(
            children: [
              const ScreenAppBar(title: 'my_medicines'),
              Expanded(
                child: _user.medicines.isEmpty
                    ? const NoMedicinesCell()
                    : ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: _user.medicines.length,
                        itemBuilder: (context, index) {
                          final medicine = _user.medicines[index];
                          return MedicineCell(
                            model: medicine,
                            onEdit: () => _showEditMedicineDialog(medicine),
                            onDelete: () => _showDeleteMedicineDialog(medicine),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showDeleteMedicineDialog(MedicineModel medicine) async {
    final confirmed = await Get.dialog<bool>(
      AlertDialog(
        title: Text('delete_medicine'.tr),
        content: Text('delete_medicine_confirmation'.tr),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: Text('cancel'.tr),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: Text(
              'delete_medicine'.tr,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await _user.deleteMedicine(medicine: medicine);
    }
  }

  Future<void> _showEditMedicineDialog(MedicineModel medicine) async {
    final medicineNameController =
        TextEditingController(text: medicine.medicineName);
    final dosageController = TextEditingController(text: medicine.dosage);
    TimeOfDay? selectedTime = _parseStoredTime(medicine.time);

    await Get.dialog(
      StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text('edit_medicine'.tr),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: medicineNameController,
                    decoration: InputDecoration(
                      labelText: 'medicine_name'.tr,
                    ),
                  ),
                  const SizedBox(height: AppPadding.kPadding),
                  TextField(
                    controller: dosageController,
                    decoration: InputDecoration(
                      labelText: 'dosage'.tr,
                    ),
                  ),
                  const SizedBox(height: AppPadding.kPadding),
                  InkWell(
                    onTap: () async {
                      final pickedTime = await showTimePicker(
                        context: context,
                        initialTime: selectedTime ?? TimeOfDay.now(),
                      );
                      if (pickedTime != null) {
                        setState(() {
                          selectedTime = pickedTime;
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        selectedTime == null
                            ? 'select_reminder_time'.tr
                            : selectedTime!.format(context),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: Get.back,
                child: Text('cancel'.tr),
              ),
              TextButton(
                onPressed: () async {
                  if (medicineNameController.text.trim().isEmpty ||
                      dosageController.text.trim().isEmpty ||
                      selectedTime == null) {
                    Get.snackbar(
                      'edit_medicine'.tr,
                      'please_fill_fields'.tr,
                      backgroundColor: ColorManager.kPrimary,
                      colorText: Colors.white,
                    );
                    return;
                  }

                  await _user.updateMedicine(
                    medicine: medicine,
                    medicineName: medicineNameController.text.trim(),
                    dosage: dosageController.text.trim(),
                    selectedTime: selectedTime!,
                  );
                  if (Get.isDialogOpen ?? false) {
                    Get.back();
                  }
                },
                child: Text('save_changes'.tr),
              ),
            ],
          );
        },
      ),
    );
  }

  TimeOfDay? _parseStoredTime(String value) {
    final formats = [
      DateFormat('yyyy-MM-dd - HH:mm'),
      DateFormat('yyyy-MM-dd – HH:mm'),
    ];

    for (final format in formats) {
      try {
        final parsed = format.parse(value);
        return TimeOfDay(hour: parsed.hour, minute: parsed.minute);
      } catch (_) {}
    }

    return null;
  }
}
