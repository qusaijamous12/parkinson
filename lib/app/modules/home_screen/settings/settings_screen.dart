import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/app_controller.dart';
import '../../../data/controller/user_controller.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../../shared/widget/app_bar.dart';
import '../../my_medicines_screen/index.dart';
import '../../profile_screen/profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _user = Get.find<UserController>(tag: 'user_controller');
    final _app = Get.find<AppController>(tag: 'app_controller');

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      body: Column(
        children: [
          const ScreenAppBar(title: 'settings'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'settings_quick_access'.tr,
                    style: getSemiBoldTextStyle(
                      color: Colors.black,
                      fontSize: FontSizeManager.fs20,
                    ),
                  ),
                  const SizedBox(height: AppPadding.kPadding / 2),
                  Text(
                    'settings_quick_access_description'.tr,
                    style: getRegulerTextStyle(color: ColorManager.greyColor),
                  ),
                  const SizedBox(height: AppPadding.kPadding),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: AppPadding.kPadding,
                      mainAxisSpacing: AppPadding.kPadding,
                      children: [
                        _SettingsCard(
                          title: 'language',
                          icon: Icons.language,
                          color: Colors.indigo,
                          onTap: _app.changeLanguage,
                        ),
                        _SettingsCard(
                          title: 'profile',
                          icon: Icons.person_outline,
                          color: Colors.teal,
                          onTap: () => Get.to(() => const ProfileScreen()),
                        ),
                        _SettingsCard(
                          title: 'my_medicines',
                          icon: Icons.medical_information_outlined,
                          color: Colors.orange,
                          onTap: () => Get.to(() => const MyMedicinesScreen()),
                        ),
                        _SettingsCard(
                          title: 'log_out',
                          icon: Icons.logout_rounded,
                          color: Colors.redAccent,
                          onTap: _user.logOut,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _SettingsCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withOpacity(0.18),
              color.withOpacity(0.08),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 14,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color,
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(height: AppPadding.kPadding / 1.5),
            Text(
              title.tr,
              textAlign: TextAlign.center,
              style: getSemiBoldTextStyle(
                color: Colors.black,
                fontSize: FontSizeManager.fs16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
