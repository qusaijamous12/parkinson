import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../shared/contstant/values_manager.dart';
import 'title_home_widget.dart';

class ChatWithDoctorWidget extends StatelessWidget {
  const ChatWithDoctorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppPadding.kPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppPadding.kPadding / 2,
        children: [
          const TitleHomeWidget(title: 'chat_with_doctors'),
          SizedBox(
            height: 200,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(
                    AppRadius.kRadius,
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,

                child: Image.network(
                  height: 170,
                  width: 140,
                  fit: BoxFit.cover,
                  'https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIzLTA4L3Jhd3BpeGVsb2ZmaWNlMV9waG90b2dyYXBoeV9vZl9hbl9zb3V0aF9pbmRpYW5fd29tZW5fYXNfYV9kb2N0b19kMzAxMDM3Zi03MDUzLTQxNDAtYmYyZS1lZDFlYWE0YTM3NDRfMS5qcGc.jpg',
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
