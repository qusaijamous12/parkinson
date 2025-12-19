import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import 'title_home_widget.dart';

class PopulerDoctorsWidget extends StatelessWidget {
  const PopulerDoctorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return       Padding(
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
              const TitleHomeWidget(title: 'populars_doctors'),
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
                child: Column(
                  spacing: AppPadding.kPadding/2,
                  children: [
                    Image.network(
                        height: 180,
                        width: 190,
                        fit: BoxFit.cover,
                        'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsb2ZmaWNlMV9waG90b2dyYXBoeV9vZl9hbl9zb3V0aF9pbmRpYW5fd29tZW5fYXNfYV9kb2N0b19kMzAxMDM3Zi03MDUzLTQxNDAtYmYyZS1lZDFlYWE0YTM3NDRfMS5qcGc.jpg'
                    ),
                    Text(
                      'Qusai Jamous',
                      style: getMediumTextStyle(color: Colors.black,fontSize: FontSizeManager.fs16),
                    ),
                    Text(
                      'Medicine Specialist',
                      style: getRegulerTextStyle(color: ColorManager.greyColor,fontSize: FontSizeManager.fs14),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for(var i=0 ;i<5;i++)
                          const Icon(Icons.star,color: Colors.yellow,)
                      ],
                    )


                  ],
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
