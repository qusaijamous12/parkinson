import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/style_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/widget/app_bar.dart';
import '../../shared/widget/my_button.dart';
import '../../shared/widget/my_divider.dart';
import '../home_screen/widget/title_home_widget.dart';
import 'widgets/doctor_details_card.dart';
import 'widgets/doctor_review_card.dart';
import 'widgets/map_card.dart';
import 'widgets/services_widget.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ScreenAppBar(title: 'doctor_details',isDoctorDetails: true,),
          Expanded(
            child: SingleChildScrollView(
              padding:  EdgeInsetsDirectional.all(AppPadding.kPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: AppPadding.kPadding,
                children: [
                   DoctorDetailsCard(),
                   DoctorReviewCard(),
                    ServicesWidget(),
                   MapCard()



                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
