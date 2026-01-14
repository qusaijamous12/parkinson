import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/widget/app_bar.dart';
import 'widgets/info_card.dart';

class HealthyDietScreen extends StatelessWidget {
  const HealthyDietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      body: Column(
        children: [
          ScreenAppBar(title: 'healthy_diet'.tr),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.kPadding),
              child: Column(
                children: [
                  const SizedBox(height: 16),

                  // Header Image
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaxFlEYrvtBStMfe3LIWFIv5H8Oy5-NHFPjg&s'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  const InfoCard(
                    title: 'eat_more_fruits_vegetables',
                    description: 'include_variety',
                  ),
                  const SizedBox(height: 16),
                  const InfoCard(
                    title: 'include_whole_grains',
                    description: 'brown_rice_oat',
                  ),
                  const SizedBox(height: 16),
                  const InfoCard(
                    title: 'healthy_proteins',
                    description: 'include_fish',
                  ),
                  const SizedBox(height: 16),
                  const InfoCard(
                    title: 'limit_processed_foods',
                    description: 'avoid_high_suga',
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
