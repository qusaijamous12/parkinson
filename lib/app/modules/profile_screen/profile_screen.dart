import 'package:flutter/material.dart';

import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/style_manager.dart';
import '../../shared/contstant/values_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(
          height: AppPadding.kPadding,
        ),
        const SizedBox(
          height: 20,
        ),
       const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQn9zilY2Yu2hc19pDZFxgWDTUDy5DId7ITqA&s'),
            )

          ],
        ),
        const SizedBox(
          height: 8,
        ),
      const  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Qusai Jamous',
              style:const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
      const  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'qusaijamous@gmail.con',
              style: TextStyle(
                  color: ColorManager.greyColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding:  EdgeInsets.only(top: 15, bottom: 8),
                child: Text(
                  'General',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding:const  EdgeInsetsDirectional.all(AppPadding.kPadding/1.6),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.withValues(alpha: 0.1),
                  ),
                  color: Colors.grey.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  spacing: AppPadding.kPadding,
                  children: [

                    GestureDetector(
                      onTap:(){


                      },
                      child: IconItemRow(
                        title: 'Edit Profile',
                        icon: Icons.edit,

                      ),
                    ),
                    GestureDetector(
                      onTap: (){

                      },
                      child: IconItemRow(
                        title: 'Log Out',
                        icon: Icons.logout,
                      ),
                    ),
                    GestureDetector(
                      onTap: ()async{


                      },
                      child: IconItemRow(
                        title: 'Start New Month',
                        icon: Icons.calendar_month,

                      ),
                    ),
                    GestureDetector(
                      onTap: ()async{

                      },
                      child: IconItemRow(
                        title: 'Payment method',
                        icon: Icons.payment,

                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        )

      ],
    );
  }

  Widget IconItemRow({required final String title,required IconData icon}){
    return Row(
      spacing: AppPadding.kPadding/1.6,
      children: [
        Icon(icon),
        Text(
          title
        )

      ],
    );
  }
}
