import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/appointment_controller.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../home_screen/widget/title_home_widget.dart';

class SelectedDate extends StatefulWidget {
  const SelectedDate({super.key});

  @override
  State<SelectedDate> createState() => _SelectedDateState();
}

class _SelectedDateState extends State<SelectedDate> {
  final _appointment=Get.find<AppointmentController>(tag: 'appointment_controller');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppPadding.kPadding,
      children: [
        const TitleHomeWidget(title: 'select_date'),

        _datePicker(context),

      ],
    );
  }

  Widget _datePicker(BuildContext context) {
    return Obx(()=>InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(const Duration(days: 60)),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: ColorManager.kPrimary,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
                dialogBackgroundColor: Colors.white,
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

        if (picked != null) {
          _appointment.selectedDate(picked);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_month_outlined),
            const SizedBox(width: 12),
            Text(
              _appointment.selectedDate.value == null
                  ? 'choose_appointment_date'.tr
                  : '${_appointment.selectedDate.value!.day}/${_appointment.selectedDate.value!.month}/${_appointment.selectedDate.value!.year}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    ));
  }
}
