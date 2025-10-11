import 'package:flutter/material.dart';

import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/style_manager.dart';
import '../../shared/contstant/values_manager.dart';
import 'widget/slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///Tab Bar
        Container(
          padding:const EdgeInsetsDirectional.all(AppPadding.kPadding),
          color: ColorManager.kPrimary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.menu,color: Colors.white,),
              Text(
                'Parkinson',
                style: getMediumTextStyle(color: Colors.white),
              ),
               Icon(Icons.menu,color:ColorManager.kPrimary ,),

            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsetsDirectional.all(AppPadding.kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Qusai Jamous',
                  style: getMediumTextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: AppPadding.kPadding,
                ),
                const HomeSlider(),
                const SizedBox(
                  height: AppPadding.kPadding*2,
                ),

                Row(
                  spacing: AppPadding.kPadding / 1.6,
                  children: [
                    Expanded(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(AppPadding.kPadding),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1), // subtle shadow
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset:const Offset(0, 4), // horizontal, vertical shadow
                            ),
                          ],
                        ),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: AppPadding.kPadding/1.6,
                          children: [
                            const Icon(Icons.people_rounded),
                            Text(
                              'Book Now',
                              style: getRegulerTextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadiusDirectional.circular(AppPadding.kPadding),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset:const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: AppPadding.kPadding/1.6,
                          children: [
                           const Icon(Icons.people_rounded),
                            Text(
                              'Parkinson Test',
                              style: getRegulerTextStyle(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                 const SizedBox(
                  height: AppPadding.kPadding*2,
                ),






              ],
            ),
          ),
        )


      ],
    );
  }
}
