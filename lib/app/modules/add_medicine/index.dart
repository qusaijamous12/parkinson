import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controller/add_medicine_controller.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/helper/notification_service.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widget/app_bar.dart';
import '../../shared/widget/my_button.dart';
import 'widgets/medicine_card.dart';
import 'widgets/medicine_text_field.dart';

class AddMedicineScreen extends StatefulWidget {
  const AddMedicineScreen({super.key});

  @override
  State<AddMedicineScreen> createState() => _AddMedicineScreenState();
}

class _AddMedicineScreenState extends State<AddMedicineScreen> {
  final _controller=Get.find<AddMedicineController>(tag: 'add_medicine_controller');




  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: Column(
            children: [
             const ScreenAppBar(title: 'add_medicine'),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(AppPadding.kPadding),
                  child: Obx(()=>Column(
                    spacing: AppPadding.kPadding,
                    children: [

                      MedicineCard(
                        title: 'medicine_information',
                        icon: Icons.medication,
                        child: Column(
                          spacing: AppPadding.kPadding,
                          children: [
                            MedicineTextField(
                              controller: _controller.medicineNameController,
                              label: 'medicine_name'.tr,
                              hint: 'e.g_panadol'.tr,
                              icon: Icons.medical_services,
                            ),
                            MedicineTextField(
                              controller: _controller.dosageController,
                              label: 'dosage'.tr,
                              hint: 'e.g_pill'.tr,
                              icon: Icons.numbers,
                            ),
                          ],
                        ),
                      ),


                      MedicineCard(
                        title: 'reminder_time'.tr,
                        icon: Icons.access_time,
                        child: GestureDetector(
                          onTap: () => _controller.pickTime(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.alarm, color: ColorManager.kPrimary),
                                const SizedBox(width: 12),
                                Text(
                                  _controller.selectedTime.value == null
                                      ? 'select_reminder_time'.tr
                                      : _controller.selectedTime.value!.format(context),
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: _controller.selectedTime.value == null
                                        ? Colors.grey
                                        : Colors.black,
                                  ),
                                ),
                                const Spacer(),
                                const Icon(Icons.chevron_right),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const Spacer(),

                      MyBtn(title: 'save_reminder'.tr, onTap: () {
                        _controller.scheduleNotification();
                      },fullWidth: true,)
                    ],
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  

  


}
