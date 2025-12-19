import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import 'title_home_widget.dart';

class OurServicesWidget extends StatelessWidget {
  const OurServicesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: const EdgeInsetsDirectional.symmetric(
          horizontal: AppPadding.kPadding),
      child: Column(
        spacing: AppPadding.kPadding,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleHomeWidget(title: 'our_services'),
          Container(
            decoration: BoxDecoration(
              borderRadius:
              BorderRadiusDirectional.circular(AppRadius.kRadius),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image.network(
                  'https://thumbs.dreamstime.com/b/african-male-doctor-happy-tablet-computer-34481166.jpg',
                  width: double.infinity,
                  height: 190,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),

                // Text
                Padding(
                  padding: const EdgeInsetsDirectional.all(
                      AppPadding.kPadding / 2),
                  child: Text(
                    'test_your_self_now'.tr,
                    style: getMediumTextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:
              BorderRadiusDirectional.circular(AppRadius.kRadius),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image.network(
                  'https://www.shutterstock.com/image-photo/portrait-handsome-male-doctor-stethoscope-600nw-2480850611.jpg',
                  width: double.infinity,
                  height: 190,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ),

                // Text
                Padding(
                  padding: const EdgeInsetsDirectional.all(
                      AppPadding.kPadding / 2),
                  child: Text(
                    'book_now'.tr,
                    style: getMediumTextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
