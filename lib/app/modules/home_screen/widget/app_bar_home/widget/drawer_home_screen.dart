import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../data/controller/login_controller.dart';
import '../../../../../shared/contstant/color_manager.dart';

class DrawerHomeScreen extends StatelessWidget {
  const DrawerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _user=Get.find<UserController>(tag: 'user_controller');
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
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Profile tapped')),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
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
            title: const Text('Language'),
            onTap: () {
              // Navigate to Language Screen
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Language tapped')),
              );
            },
          ),
        ],
      ),
    );
  }
}
