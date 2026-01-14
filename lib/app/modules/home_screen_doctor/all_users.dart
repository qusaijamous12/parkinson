import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../data/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/enum/data_status.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../chat/message_screen.dart';


class AllUsers extends StatelessWidget {
  const AllUsers({super.key});

  @override
  Widget build(BuildContext context) {
    final _home = Get.find<HomeController>(tag: 'home_controller');

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users',style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: ColorManager.kPrimary,
      ),
      body:   Obx(() {
        if (_home.getDoctorsStatus.value == ApiStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (_home.getDoctorsStatus.value == ApiStatus.failure) {
          return const Center(
            child: Text(
              'Failed to load users',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        } else if (_home.doctors.isEmpty) {
          return const Center(
            child: Text(
              'No users found',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          );
        }

        return ListView.separated(
          padding: const EdgeInsets.all(AppPadding.kPadding),
          itemCount: _home.doctors.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final user = _home.doctors[index];
            return GestureDetector(
              onTap: () => Get.to(() => MessageScreen(
                doctorId: user.uid!,
                doctorName: user.name ?? 'Doctor',
                doctorImage: user.imageUrl ?? '',
              )),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppRadius.kRadius),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.teal.shade100,
                        backgroundImage:
                        user.imageUrl != null && user.imageUrl!.isNotEmpty
                            ? NetworkImage(user.imageUrl!)
                            : null,
                        child: user.imageUrl == null || user.imageUrl!.isEmpty
                            ? const Icon(Icons.person, color: Colors.white)
                            : null,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name ?? 'Doctor',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              user.email ?? '',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: ColorManager.kPrimary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Chat',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
