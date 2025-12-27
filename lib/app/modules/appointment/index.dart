import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../data/controller/appointment_controller.dart';
import '../../data/enum/data_status.dart';
import '../../data/model/user_model.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widget/app_bar.dart';
import '../../shared/widget/my_button.dart';
import '../../shared/widget/my_loading.dart';
import 'widgets/contact_info.dart';
import 'widgets/doctor_card.dart';
import 'widgets/selected_date.dart';
import 'widgets/selected_time.dart';

class AppointmentScreen extends StatelessWidget {
  final UserModel userModel;

  const AppointmentScreen({super.key, required this.userModel});

  @override
  Widget build(BuildContext context) {
    final _appointment = Get.find<AppointmentController>(
      tag: 'appointment_controller',
    );
    return Obx(()=>Scaffold(
      body: LoadingOverlay(
        isLoading: _appointment.confirmApiStatus.value == ApiStatus.loading,
        child: Column(
          children: [
            const ScreenAppBar(title: 'appointment'),
            Expanded(
              child: SingleChildScrollView(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppPadding.kPadding),
                  child: Column(
                    spacing: AppPadding.kPadding,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DoctorCard(model: userModel),
                      const ContactInfo(),
                      const SelectedDate(),
                      const SelectedTime(),
                      MyBtn(
                        title: 'confirm_appointment'.tr,
                        onTap: () async {
                          await _appointment.confirmAppointment();
                        },
                        fullWidth: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        progressIndicator:const MyLoading(),
      ),
    ));
  }
}
