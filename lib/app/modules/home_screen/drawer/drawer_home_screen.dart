
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/app_controller.dart';
import '../../../data/controller/user_controller.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../my_medicines_screen/index.dart';
import '../../profile_screen/profile_screen.dart';

class DrawerHomeScreen extends StatelessWidget {
  const DrawerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _user=Get.find<UserController>(tag: 'user_controller');
    final _app=Get.find<AppController>(tag: 'app_controller');
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName:  Text('${_user.userModel?.name?.capitalizeFirst}'),
            accountEmail:  Text('${_user.userModel?.email}'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                '${_user.userModel?.imageUrl}',
              ),
            ),
            decoration: BoxDecoration(
              color: ColorManager.kPrimary,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title:  Text('profile'.tr),
            onTap: () {
              Get.back();
              Get.to(()=>const ProfileScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.medical_information_outlined),
            title:  Text('my_medicines'.tr),
            onTap: () {
              Get.back();
              Get.to(()=>const MyMedicinesScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title:  Text('settings'.tr),
            onTap: () {
              // Navigate to Settings Screen
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Settings tapped')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title:  Text('language'.tr),
            onTap: () {
              Get.back();
              _app.changeLanguage();
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title:  Text('log_out'.tr),
            onTap: () {
              Get.back();
              _user.logOut();
            },
          ),
        ],
      ),
    );
  }
}
