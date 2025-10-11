import 'package:flutter/material.dart';

import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';

class HomeSlider extends StatelessWidget {
  const HomeSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppPadding.kPadding,
      children: [
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              color: ColorManager.kPrimary,
              borderRadius: BorderRadiusDirectional.circular(AppPadding.kPadding/1.6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1), // subtle shadow
                spreadRadius: 1,
                blurRadius: 8,
                offset:const Offset(0, 4), // horizontal, vertical shadow
              ),
            ]

          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.all(AppPadding.kPadding/1.6),
            child: Column(
              spacing: AppPadding.kPadding/1.6,
              children: [
                Row(
                  spacing: AppPadding.kPadding/1.6,
                  children: [
                   const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/03/21/23/37/360_F_321233723_3nSdORPnL4nPOfGEocyCGVCI0RoXuRVo.jpg'),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Qusai Jamous',
                          style: getRegulerTextStyle(color: Colors.white,fontSize: FontSizeManager.fs12),
                        ),
                        Text(
                          '2 Year Experiance',
                          style: getRegulerTextStyle(color: Colors.white,fontSize: FontSizeManager.fs12),
                        ),

                        
                      ],
                    ),
                    const Spacer(),
                    PopupMenuButton<String>(
                      icon: const Icon(Icons.more_vert_outlined, color: Colors.white),
                      onSelected: (value) {
                        if (value == 'view') {
                          print('Edit pressed');
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'view',
                          child: Text('View'),
                        ),

                      ],
                    )

                  ],
                ),
                Row(
                  spacing: AppPadding.kPadding/1.6,
                  children: [
                    const Icon(Icons.star,color: Colors.yellow,),
                    Text(
                      '4 Star',
                      style: getRegulerTextStyle(color: Colors.white),
                    )

                  ],
                ),
                 Row(
                  children: [
                    Expanded(
                      child: Row(
                        spacing:AppPadding.kPadding/1.6,
                        children: [
                         const Icon(Icons.calendar_month,color: Colors.white,),
                          Text(
                            '5 Oct',
                            style: getRegulerTextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        spacing: AppPadding.kPadding/1.6,
                        children: [
                         const Icon(Icons.watch_later,color: Colors.white,),
                          Text(
                              '5 Oct',
                            style: getRegulerTextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

        ),


      ],
    );
  }
}
