import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/style_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/widget/my_text_field.dart';

class ListChatScreen extends StatefulWidget {
  const ListChatScreen({super.key});

  @override
  State<ListChatScreen> createState() => _ListChatScreenState();
}

class _ListChatScreenState extends State<ListChatScreen> {
  final _searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppPadding.kPadding,
      children: [
        Container(
          padding:const EdgeInsetsDirectional.all(AppPadding.kPadding),
          color: ColorManager.kPrimary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text(
                'Parkinson',
                style: getMediumTextStyle(color: Colors.white),
              ),

            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding:const EdgeInsetsDirectional.all(AppPadding.kPadding),
            child: Column(
              spacing: AppPadding.kPadding,
              children: [
                MyTextField(hintText: 'Search', textInputType: TextInputType.text, controller: _searchController),
                Row(
                  children: [
                   const CircleAvatar(
                      radius: 35,
                      backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/03/21/23/37/360_F_321233723_3nSdORPnL4nPOfGEocyCGVCI0RoXuRVo.jpg'),
                    ),
                    const SizedBox(
                      width: AppPadding.kPadding/1.6,
                    ),
                    Text(
                      'Qusai Jamous',
                      style: getMediumTextStyle(color: Colors.black),
                    ),
                    const Spacer(),
                   const Icon(Icons.arrow_forward_ios,color: Colors.black,)
                  ],
                )

              ],
            ),
          ),
        )


      ],
    );
  }
}
