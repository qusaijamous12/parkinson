import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

import '../../data/controller/user_controller.dart';
import '../../data/enum/data_status.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widget/my_loading.dart';

class DoctorAppointmentsScreen extends StatelessWidget {
  const DoctorAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = Get.find<UserController>(tag: 'user_controller');

    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'doctor_appointments'.tr,
          style:const TextStyle(color: Colors.white),
        ),
        backgroundColor: ColorManager.kPrimary,
      ),
      body: Obx(() {
        switch (_user.getDoctorAppointmentsApiStatus.value) {
          case ApiStatus.loading:
            return const Center(child: MyLoading());

          case ApiStatus.success:
            if (_user.doctorAppointments.isEmpty) {
              // Modern empty state UI
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/no_appointments.png',
                        // Use an illustration
                        height: 200,
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'no_appointments_yet'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.kPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                       Text(
                        'you_currently'.tr,
                        textAlign: TextAlign.center,
                        style:const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          _user.getDoctorAppointments();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorManager.kPrimary,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child:  Text(
                          'refresh'.tr,
                          style:const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            // Display appointments if there are any
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _user.doctorAppointments.length,
              itemBuilder: (context, index) {
                final patient = _user.doctorAppointments[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTueIx2Jkawe7r91I50VfVAZLS60yx8RjiSfQ&s',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                patient.patinetName ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${'time'.tr}: ${patient.time ?? ''}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "${'contact_number'.tr}: ${patient.contactNumber ?? ''}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(height: 4),
                              // Inside your card:
                              Text(
                                "${'date'.tr}: ${patient.date != null ? DateFormat('dd MMM yyyy, hh:mm a').format(patient.date!) : ''}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          spacing: AppPadding.kPadding / 2,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await _user.updateAppointmentStatus(
                                  status: 'accepted',
                                  patientId:
                                      _user
                                          .doctorAppointments[index]
                                          .patinetUid ??
                                      '',
                                  time:
                                      _user.doctorAppointments[index].time ??
                                      '',
                                  date: patient.date != null
                                      ? DateFormat('yyyy-MM-dd HH:mm:ss').format(patient.date!)
                                      : '',
                                );
                                if (_user
                                        .updateAppointmentStatusApiStatus
                                        .value ==
                                    ApiStatus.success) {
                                  Utils.showToast(
                                    title: 'Success',
                                    type: ToastificationType.success,
                                  );
                                } else {
                                  Utils.showToast(
                                    title: 'Failed',
                                    type: ToastificationType.error,
                                  );
                                }
                              },
                              child: Container(
                                padding: const EdgeInsetsDirectional.all(
                                  AppPadding.kPadding / 2,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorManager.kPrimary,
                                  borderRadius:
                                      BorderRadiusDirectional.circular(
                                        AppRadius.kRadius / 2,
                                      ),
                                ),
                                child: const Text(
                                  'Accept',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsetsDirectional.all(
                                AppPadding.kPadding / 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadiusDirectional.circular(
                                  AppRadius.kRadius / 2,
                                ),
                              ),
                              child: const Text(
                                'Reject',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );

          case ApiStatus.noData:
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.hourglass_empty,
                      size: 150,
                      color: ColorManager.kPrimary,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      'no_appointments_yet'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: ColorManager.kPrimary,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'you_currently'.tr,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        _user.getDoctorAppointments();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.kPrimary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'refresh'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );

          default:
            return const SizedBox.shrink();
        }
      }),
    );
  }
}
