import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';

import '../../../data/model/user_model.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';

class DoctorCard extends StatelessWidget {
  final UserModel model;
  const DoctorCard({super.key,required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsetsDirectional.all(AppPadding.kPadding/2),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(AppRadius.kRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            spreadRadius: 2,
            offset:const Offset(0, 4), // shadow position
          ),
        ],
      ),
      child: Column(
        spacing: AppPadding.kPadding,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: AppPadding.kPadding/2,
            children: [
              Image.network('${model.imageUrl}',height: 100,width: 100,fit: BoxFit.cover,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${model.name?.capitalize}',
                            style: getMediumTextStyle(color: Colors.black,fontSize: FontSizeManager.fs16),
                          ),
                        ),
                        const Icon(Icons.favorite,color: Colors.red,)
                      ],
                    ),
                    Text(
                      '${model.major?.capitalize} ',
                      style: getRegulerTextStyle(color: ColorManager.greyTextLogin,fontSize: FontSizeManager.fs14),
                    ),
                    const SizedBox(
                      height: AppPadding.kPadding/2,
                    ),
                    Row(
                      children: [
                        StarRating(
                          rating: model.rate?.toDouble()??0,
                        ),
                        const Spacer(),
                        Text(
                          '\$ 28.0/hr',
                          style: getRegulerTextStyle(color: ColorManager.kPrimary,fontSize: FontSizeManager.fs14),
                        )
                      ],
                    )

                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
