import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/user_model.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../doctor_details_screen/index.dart';

class DoctorWidget extends StatelessWidget {
  final UserModel model;
  const DoctorWidget({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: ()=>Get.to( DoctorDetailsScreen(model: model,)),
      behavior: HitTestBehavior.opaque,
      child: Row(
        spacing: AppPadding.kPadding/2,
        children: [
           CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              '${model.imageUrl}'

            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${model.name?.capitalize}',
                  style: getMediumTextStyle(color: Colors.black,fontSize: FontSizeManager.fs14),
                ),
                Text(
                  '${model.major?.capitalize}',
                  style: getMediumTextStyle(color: ColorManager.lightGrey,fontSize: FontSizeManager.fs14),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios,color: Colors.black,)
        ],
      ),
    );
  }
}
