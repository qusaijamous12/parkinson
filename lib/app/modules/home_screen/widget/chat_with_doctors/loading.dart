import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared/contstant/color_manager.dart';
import '../../../../shared/contstant/values_manager.dart';
import '../title_home_widget.dart';
import 'package:redacted/redacted.dart';


class ChatWithDoctorsLoading extends StatelessWidget {
  const ChatWithDoctorsLoading({super.key});

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
         const TitleHomeWidget(title: 'chat_with_doctors').redacted(
            context: context,
            redact: true,
            configuration: RedactedConfiguration(
              redactedColor: ColorManager.moreLightGrey

            ),
          ),
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                height: 170,
                width: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(
                    AppRadius.kRadius,
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,


              ).redacted(
                context: context,
                redact: true,
                configuration: RedactedConfiguration(
                    redactedColor:ColorManager.moreLightGrey

                ),
              ),
              separatorBuilder: (context, index) =>
              const SizedBox(width: AppPadding.kPadding / 2),
              itemCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
