import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';

class TitleHomeWidget extends StatelessWidget {
  final String title;
  const TitleHomeWidget({super.key,required this.title  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title.tr,
      style: getMediumTextStyle(
        color: Colors.black,
        fontSize: FontSizeManager.fs20,
      ),
    );
  }
}
