import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/controller/appointment_controller.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../../shared/widget/my_text_field.dart';
import '../../home_screen/widget/title_home_widget.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  final _appointment=Get.find<AppointmentController>(tag: 'appointment_controller');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppPadding.kPadding,
      children: [
        const TitleHomeWidget(title: 'appointment_for'),

        MyTextField(
          hintText: 'patient_name'.tr,
          textInputType: TextInputType.text,
          controller: _appointment.patientName,
        ),

        MyTextField(
          hintText: 'contact_number'.tr,
          textInputType: TextInputType.phone,
          controller: _appointment.contactNumber,
        ),
      ],
    );
  }
}
