import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/app_controller.dart';
import '../../data/controller/home_controller.dart';
import '../../data/controller/user_controller.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/style_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../profile_screen/profile_screen.dart';
import 'all_users.dart';
import 'doctor_appointments_screen.dart';

class HomeScreenDoctor extends StatelessWidget {
  const HomeScreenDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = Get.find<UserController>(tag: 'user_controller');
    final _app=Get.find<AppController>(tag: 'app_controller');

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AppBar
          Container(
            height: 100,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: AppPadding.kPadding),
            width: double.infinity,
            color: ColorManager.kPrimary,
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'doctor_dashboard'.tr,
                      style: getMediumTextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Welcome Text
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.kPadding),
            child: Text(
              '${'hi'.tr}, ${'doctor'.tr}. ${_user.userModel?.name}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Feature Grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.kPadding),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _featureCard(
                    context,
                    title: 'Chats',
                    icon: Icons.chat,
                    color: Colors.orangeAccent,
                    onTap: () {
                      final _home=Get.find<HomeController>(tag: 'home_controller');
                      _home.getDoctors(isDoctors: false);
                      Get.to(()=>const AllUsers());
                    },
                  ),
                  _featureCard(
                    context,
                    title: 'appointments',
                    icon: Icons.calendar_today,
                    color: Colors.blueAccent,
                    onTap: () {
                      _user.getDoctorAppointments();
                      Get.to(()=>const DoctorAppointmentsScreen());
                    },
                  ),
                  _featureCard(
                    context,
                    title: 'profile',
                    icon: Icons.person,
                    color: Colors.greenAccent,
                    onTap: ()=>Get.to(()=>const ProfileScreen()),
                  ),
                  _featureCard(
                    context,
                    title: 'log_out',
                    icon: Icons.logout,
                    color: Colors.redAccent,
                    onTap: () => _user.logOut(),
                  ),
                  _featureCard(
                    context,
                    title: 'language',
                    icon: Icons.language,
                    color: Colors.purpleAccent,
                    onTap: ()=>_app.changeLanguage(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Feature Card Widget
  Widget _featureCard(BuildContext context,
      {required String title,
        required IconData icon,
        required Color color,
        required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color,
              child: Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
