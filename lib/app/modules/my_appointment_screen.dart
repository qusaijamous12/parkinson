import 'package:flutter/material.dart';

import '../shared/contstant/style_manager.dart';
import '../shared/contstant/values_manager.dart';
import '../shared/widget/app_bar.dart';

class MyAppointmentScreen extends StatelessWidget {
  const MyAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const  ScreenAppBar(title: 'notifications'),
          Expanded(
            child: SingleChildScrollView(
              padding:const EdgeInsetsDirectional.all(AppPadding.kPadding),
              child: Column(
                children: [

                  Text(
                    'There is No Accepted Appointments Yet',
                    style: getBoldTextStyle(color: Colors.black,fontSize: FontSizeManager.fs18),
                  )
                  
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}
