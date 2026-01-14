import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controller/user_controller.dart';
import '../data/enum/data_status.dart';
import '../data/model/user_appointment.dart';
import '../shared/contstant/style_manager.dart';
import '../shared/contstant/values_manager.dart';
import '../shared/widget/app_bar.dart';

import 'package:flutter/material.dart';
import '../shared/contstant/style_manager.dart';
import '../shared/contstant/values_manager.dart';
import '../shared/widget/app_bar.dart';
import '../shared/widget/my_loading.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _user=Get.find<UserController>(tag: 'user_controller');


    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScreenAppBar(title: 'My Appointments'),
          Obx((){
            switch(_user.getUserAppointmentsApiStatus.value){
              case ApiStatus.success:
                return Expanded(
                  child:  ListView.builder(
                    padding: const EdgeInsets.all(AppPadding.kPadding),
                    itemCount: _user.userAppointments.length,
                    itemBuilder: (context, index) {
                      final appointment = _user.userAppointments[index];
                      return _buildAppointmentCard(appointment);
                    },
                  ),
                );
              case ApiStatus.noData:
                return _buildEmptyState();
                case ApiStatus.loading:
                  return const Center(child: MyLoading());
              default:
                return const SizedBox.shrink();
            }
          }),
        ],
      ),
    );
  }

  // Empty state UI
  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: 120,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 24),
            Text(
              'No Appointments Yet!',
              textAlign: TextAlign.center,
              style: getBoldTextStyle(
                  color: Colors.black, fontSize: FontSizeManager.fs22),
            ),
            const SizedBox(height: 12),
            Text(
              'You have no accepted or rejected appointments from doctors yet.',
              textAlign: TextAlign.center,
              style: getRegulerTextStyle(
                  color: Colors.grey, fontSize: FontSizeManager.fs16),
            ),
          ],
        ),
      ),
    );
  }

  // Appointment card UI
  Widget _buildAppointmentCard(final UserAppointmentModel model) {
    final status = model.appointmentStatus;
    Color statusColor;
    String statusText;

    if (status == 'accepted') {
      statusColor = Colors.green;
      statusText = 'Accepted';
    } else if (status == 'rejected') {
      statusColor = Colors.red;
      statusText = 'Rejected';
    } else {
      statusColor = Colors.grey;
      statusText = 'Pending';
    }

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.teal.shade100,
              child: Image.network(model.doctorImage??''),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.doctorName??'',
                    style: getBoldTextStyle(
                        color: Colors.black, fontSize: FontSizeManager.fs18),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "${model.date??''} | ${model.time??''}",
                    style: getRegulerTextStyle(
                        color: Colors.grey, fontSize: FontSizeManager.fs14),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                statusText,
                style: getBoldTextStyle(color: statusColor, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
