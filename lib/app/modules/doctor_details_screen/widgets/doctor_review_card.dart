import 'package:flutter/material.dart';

import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';

class DoctorReviewCard extends StatelessWidget {
  const DoctorReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return     Container(
      padding:const EdgeInsetsDirectional.all(AppPadding.kPadding/2),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 10,
              spreadRadius: 2,
              offset:const Offset(0, 4), // shadow position
            ),
          ],
          borderRadius: BorderRadiusDirectional.circular(AppRadius.kRadius)
      ),
      child: Row(
        spacing: AppPadding.kPadding,
        children: [
          Expanded(
            child: Container
              (
              padding:const EdgeInsetsDirectional.all(AppPadding.kPadding/2),
              decoration:BoxDecoration(
                  color: ColorManager.greyColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadiusDirectional.circular(AppRadius.kRadius)
              ),
              child: Column(
                spacing: AppPadding.kPadding/2,
                children: [
                  Text(
                    '100',
                    style: getBoldTextStyle(color: Colors.black,fontSize: FontSizeManager.fs16),
                  ),
                  Text(
                    'Runing',
                    style: getRegulerTextStyle(color: ColorManager.lightGrey,fontSize: FontSizeManager.fs14),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container
              (
              padding:const EdgeInsetsDirectional.all(AppPadding.kPadding/2),
              decoration:BoxDecoration(
                  color: ColorManager.greyColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadiusDirectional.circular(AppRadius.kRadius)
              ),
              child: Column(
                spacing: AppPadding.kPadding/2,
                children: [
                  Text(
                    '500',
                    style: getBoldTextStyle(color: Colors.black,fontSize: FontSizeManager.fs16),
                  ),
                  Text(
                    'Ongoing',
                    style: getRegulerTextStyle(color: ColorManager.lightGrey,fontSize: FontSizeManager.fs14),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Container
              (
              padding:const EdgeInsetsDirectional.all(AppPadding.kPadding/2),
              decoration:BoxDecoration(
                  color: ColorManager.greyColor.withValues(alpha: 0.2),
                  borderRadius: BorderRadiusDirectional.circular(AppRadius.kRadius)
              ),
              child: Column(
                spacing: AppPadding.kPadding/2,
                children: [
                  Text(
                    '700',
                    style: getBoldTextStyle(color: Colors.black,fontSize: FontSizeManager.fs16),
                  ),
                  Text(
                    'Patient',
                    style: getRegulerTextStyle(color: ColorManager.lightGrey,fontSize: FontSizeManager.fs14),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
