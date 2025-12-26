import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';

import '../../../../data/controller/home_controller.dart';
import '../../../../shared/contstant/color_manager.dart';
import '../../../../shared/contstant/style_manager.dart';
import '../../../../shared/contstant/values_manager.dart';
import '../title_home_widget.dart';

class PopulerDoctorsSuccessWidget extends StatelessWidget {
  const PopulerDoctorsSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _home=Get.find<HomeController>(tag: 'home_controller');
    return  Padding(
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
                      '${_home.doctors[index].imageUrl}'
                    ),
                    Text(
                      '${_home.doctors[index].name?.capitalize}',
                      style: getMediumTextStyle(color: Colors.black,fontSize: FontSizeManager.fs16),
                    ),
                    Text(
                      '${_home.doctors[index].major?.capitalize}',
                      style: getRegulerTextStyle(color: ColorManager.greyColor,fontSize: FontSizeManager.fs14),
                    ),
                    StarRating(
                      rating: _home.doctors[index].rate?.toDouble()??0,
                      allowHalfRating: false,
                    ),


                  ],
                ),
              ),
              separatorBuilder: (context,index)=>const SizedBox(width: AppPadding.kPadding/2,),
              itemCount: _home.doctors.length,
            ),
          ),
        ],
      ),
    );
  }
}
