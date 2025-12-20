import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../doctor_details_screen/index.dart';

class DoctorWidget extends StatelessWidget {
  const DoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: ()=>Get.to(const DoctorDetailsScreen()),
      behavior: HitTestBehavior.opaque,
      child: Row(
        spacing: AppPadding.kPadding/2,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbVKpevEhTFC4msGk6g8tia_AXKrLSRib5Hw&s',

            ),
          ),
          Expanded(
            child: Text(
              'Qusai Jamous',
              style: getMediumTextStyle(color: Colors.black,fontSize: FontSizeManager.fs14),
            ),
          ),
          const Icon(Icons.arrow_forward_ios,color: Colors.black,)
        ],
      ),
    );
  }
}
