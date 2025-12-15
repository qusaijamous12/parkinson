import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/image_manager.dart';
import '../../../shared/contstant/style_manager.dart';

class DoctorWithShadow extends StatelessWidget {
  const DoctorWithShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(ImageManager.onBoardLogo),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white.withValues(alpha: 0.0)
            ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const[0.14,0.4]
            ),


          ),
          child: Image.asset(ImageManager.doctorImage),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Text(
            'best_doctor_appointment_app'.tr,
              textAlign: TextAlign.center,
              style:getBoldTextStyle(color: ColorManager.kPrimary,fontSize: 22) ,
          ),
        )
      ],
    );
  }
}
