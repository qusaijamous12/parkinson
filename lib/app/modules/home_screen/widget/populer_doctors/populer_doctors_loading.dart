import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redacted/redacted.dart';

import '../../../../shared/contstant/color_manager.dart';
import '../../../../shared/contstant/style_manager.dart';
import '../../../../shared/contstant/values_manager.dart';
import '../title_home_widget.dart';

class PopulerDoctorsLoading extends StatelessWidget {
  const PopulerDoctorsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPadding.kPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppPadding.kPadding / 2,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const TitleHomeWidget(title: 'populars_doctors').redacted(
        context: context,
        redact: true,
        configuration: RedactedConfiguration(
            redactedColor: ColorManager.moreLightGrey

        ),
      ),
              TextButton(
                onPressed: () {},
                child: Row(
                  spacing: AppPadding.kPadding / 3,
                  children: [
                    Text(
                      'see_all'.tr,
                      style: getMediumTextStyle(
                        color: ColorManager.kPrimary,
                        fontSize: FontSizeManager.fs14,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorManager.kPrimary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 290,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index)=>Container(
                height: 290,
                width: 190,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(AppRadius.kRadius),
                    color: Colors.white
                ),
              ).redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                  redactedColor: ColorManager.moreLightGrey,
                ),
              ),
              separatorBuilder: (context,index)=>const SizedBox(width: AppPadding.kPadding/2,),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
