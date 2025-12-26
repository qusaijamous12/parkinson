import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/controller/home_controller.dart';
import '../../../../shared/contstant/values_manager.dart';
import '../title_home_widget.dart';

class SuccessChatWithDoctors extends StatelessWidget {
  const SuccessChatWithDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    final _homeController=Get.find<HomeController>(tag: 'home_controller');
    return   Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPadding.kPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppPadding.kPadding / 2,
        children: [
          const TitleHomeWidget(title: 'chat_with_doctors'),
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(
                    AppRadius.kRadius,
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,

                child: Image.network(
                  height: 170,
                  width: 140,
                  fit: BoxFit.cover,
                  '${_homeController.doctors[index].imageUrl}'
                ),
              ),
              separatorBuilder: (context, index) =>
              const SizedBox(width: AppPadding.kPadding / 2),
              itemCount: _homeController.doctors.length,
            ),
          ),
        ],
      ),
    );
  }
}
