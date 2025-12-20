import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/style_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/widget/app_bar.dart';
import '../../shared/widget/my_divider.dart';
import '../../shared/widget/my_text_field.dart';
import 'widgets/doctor_widget.dart';

class SearchDoctorsScreen extends StatelessWidget {
  const SearchDoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _searchController = TextEditingController();
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: Column(
            children: [
              const ScreenAppBar(title: 'search_screen'),
              Expanded(
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(AppPadding.kPadding),
                  child: Column(
                    children: [
                      MyTextField(
                        hintText: 'search'.tr,
                        textInputType: TextInputType.text,
                        controller: _searchController,
                      ),
                      if (false) ...[
                        Expanded(
                          child: Center(
                            child: Text(
                              'sorry_find'
                                  .tr,
                              style: getMediumTextStyle(
                                color: ColorManager.greyColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ] else ...[
                        Expanded(
                          child: ListView.separated(
                            itemBuilder: (context,index)=>const DoctorWidget(),
                            separatorBuilder: (context,index)=>const MyDivider(),
                            itemCount: 10,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
