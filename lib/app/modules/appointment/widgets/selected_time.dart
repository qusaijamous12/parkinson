import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/appointment_controller.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../home_screen/widget/title_home_widget.dart';

class SelectedTime extends StatefulWidget {
  const SelectedTime({super.key});

  @override
  State<SelectedTime> createState() => _SelectedTimeState();
}

class _SelectedTimeState extends State<SelectedTime> {
  final _appointment=Get.find<AppointmentController>(tag: 'appointment_controller');




  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppPadding.kPadding,
      children: [
        const TitleHomeWidget(title: 'select_time'),

        _timePicker(),

      ],
    );
  }

  Widget _timePicker() {
    return Obx(()=>Wrap(
      spacing: 12,
      runSpacing: 12,
      children: _appointment.timeSlots.map((time) {
        final isSelected = _appointment.selectedTime.value == time;
        return ChoiceChip(
          label: Text(time),
          selected: isSelected,
          onSelected: (_) {
            _appointment.selectedTime(time);
          },

          selectedColor: ColorManager.kPrimary,
          labelStyle: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
          ),
        );
      }).toList(),
    ));
  }
}
