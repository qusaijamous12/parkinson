import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../../shared/widget/my_button.dart';

class DoctorDetailsCard extends StatelessWidget {
  const DoctorDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
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
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbVKpevEhTFC4msGk6g8tia_AXKrLSRib5Hw&s',height: 100,width: 100,fit: BoxFit.cover,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Dr. Pediatrician',
                            style: getMediumTextStyle(color: Colors.black,fontSize: FontSizeManager.fs16),
                          ),
                        ),
                        const Icon(Icons.favorite,color: Colors.red,)
                      ],
                    ),
                    Text(
                      'Specialist Cardiologist ',
                      style: getRegulerTextStyle(color: ColorManager.greyTextLogin,fontSize: FontSizeManager.fs14),
                    ),
                    const SizedBox(
                      height: AppPadding.kPadding/2,
                    ),
                    Row(
                      children: [
                        for(var i=0;i<5;i++)
                          const Icon(Icons.star,color: Colors.yellow,),
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
          MyBtn(title: 'book_now_'.tr, onTap: (){})
        ],
      ),
    );
  }
}
