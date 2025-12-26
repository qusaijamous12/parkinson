import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/controller/home_controller.dart';
import '../../data/model/user_model.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/style_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widget/app_bar.dart';
import '../../shared/widget/my_divider.dart';
import '../../shared/widget/my_text_field.dart';
import 'widgets/doctor_widget.dart';

class SearchDoctorsScreen extends StatefulWidget {
  const SearchDoctorsScreen({super.key});

  @override
  State<SearchDoctorsScreen> createState() => _SearchDoctorsScreenState();
}

class _SearchDoctorsScreenState extends State<SearchDoctorsScreen> {
  final _home=Get.find<HomeController>(tag: 'home_controller');
  List<UserModel> allDoctors = [];
  List<UserModel> filteredUsers = [];
  late final _searchController;

  @override
  void initState() {
    allDoctors = _home.doctors; // OR home.users
    filteredUsers = allDoctors;

    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
    super.initState();
  }


  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();

    if(mounted)
    setState(() {
      if (query.isEmpty) {
        filteredUsers = allDoctors;
      } else {
        filteredUsers = allDoctors.where((user) {
          return user.name!.toLowerCase().contains(query);
        }).toList();
      }
    });
  }


  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: ()=>Utils.closeKeyboard(),
      child: Container(
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
                        ///This CASE wILL sHOW IS USER SEARCH AND THERE IS NO USERS HERE
                        if (filteredUsers.isEmpty)
                          Expanded(
                            child: Center(
                              child: Text(
                                'sorry_find'.tr,
                                textAlign: TextAlign.center,
                                style: getMediumTextStyle(
                                  color: ColorManager.greyColor,
                                ),
                              ),
                            ),
                          ) else ...[
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (context,index)=> DoctorWidget(model:filteredUsers[index] ,),
                              separatorBuilder: (context,index)=>const MyDivider(),
                              itemCount: filteredUsers.length,
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
      ),
    );
  }
}
