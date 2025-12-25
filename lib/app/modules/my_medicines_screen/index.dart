import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../data/controller/user_controller.dart';
import '../../data/enum/data_status.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/style_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/widget/app_bar.dart';
import '../../shared/widget/my_loading.dart';
import 'widgets/medicine_cell.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/no_medicines_cell.dart';

class MyMedicinesScreen extends StatefulWidget {
  const MyMedicinesScreen({super.key});

  @override
  State<MyMedicinesScreen> createState() => _MyMedicinesScreenState();
}

class _MyMedicinesScreenState extends State<MyMedicinesScreen> {
  final _user = Get.find<UserController>(tag: 'user_controller');

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _user.getMyMedicines();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>LoadingOverlay(
        isLoading: _user.getMyMedicinesApiStatus.value == ApiStatus.loading,
        child: Column(
          children: [
            const ScreenAppBar(title: 'my_medicines'),
            Expanded(
              child: _user.medicines.isEmpty
                  ? const NoMedicinesCell()
                  : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _user.medicines.length,
                itemBuilder: (context, index) {
                  final medicine = _user.medicines[index];
                  return MedicineCell(model: medicine);
                },
              ),
            )
          ],
        ),
        progressIndicator:const MyLoading(),
      )),
    );
  }
}
