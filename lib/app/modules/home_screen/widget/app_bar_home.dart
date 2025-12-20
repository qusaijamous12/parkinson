import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/login_controller.dart';
import '../../../routes/route_manager.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../../shared/widget/search_text_field.dart';
import '../../search_screen/index.dart';

class AppBarHome extends StatelessWidget {
  final void Function()? onTapMenu;
  final void Function()? onTapLanguage;

  const AppBarHome({
    super.key,
    required this.onTapMenu,
    required this.onTapLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final _userController=Get.find<UserController>(tag: 'user_controller');
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          height: 270,
          padding: const EdgeInsetsDirectional.all(AppPadding.kPadding),
          decoration: BoxDecoration(
            color: ColorManager.kPrimary,
            borderRadius: BorderRadiusDirectional.circular(
              AppRadius.kRadius * 4,
            ),
          ),
          child: SafeArea(
            child: Column(
              spacing: AppPadding.kPadding,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: onTapMenu,
                      child: const Icon(Icons.menu, color: Colors.white),
                    ),
                    GestureDetector(
                      onTap:onTapLanguage,
                      child:const Icon(Icons.language, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: AppPadding.kPadding / 2,
                        children: [
                          Text(
                            '${'hi'.tr} ${_userController.userModel?.name?.capitalizeFirst}! ',
                            style: getMediumTextStyle(
                              color: Colors.white,
                              fontSize: FontSizeManager.fs20,
                            ),
                          ),
                          Text(
                            'find_your_doctor'.tr.toUpperCase(),
                            style: getBoldTextStyle(
                              color: Colors.white,
                              fontSize: FontSizeManager.fs22,
                            ),
                          ),
                        ],
                      ),
                    ),
                     CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage('${_userController.userModel?.imageUrl}'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: ()=>Get.to(const SearchDoctorsScreen()),
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: AppPadding.kPadding,
              vertical: AppPadding.kPadding,
            ),
            child: IgnorePointer(
              ignoring: true,
              child: SearchTextField(
                hintText: 'search'.tr,
                textInputType: TextInputType.text,
                controller: TextEditingController(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
