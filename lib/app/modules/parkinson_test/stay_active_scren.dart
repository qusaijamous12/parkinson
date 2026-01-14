import 'package:flutter/material.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/widget/app_bar.dart';
import 'widgets/info_card.dart';

class StayActiveScreen extends StatelessWidget {
  const StayActiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          const ScreenAppBar(title: 'stay_active'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.kPadding),
              child: Column(
                children: [
                  const SizedBox(height: 16),

                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: NetworkImage('https://domf5oio6qrcr.cloudfront.net/medialibrary/6442/655cbbd3-15e7-4007-b992-72e8bae5de9d.jpg'), // replace with your asset
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Info Cards
                  const InfoCard(
                    title: 'daily_stretching',
                    description: 'perform_gentle',
                  ),
                  const SizedBox(height: 16),
                  const InfoCard(
                    title: 'balance_exercises',
                    description: 'practice_standing',
                  ),
                  const SizedBox(height: 16),
                  const InfoCard(
                    title: 'strength_training',
                    description: 'use_light_weight',
                  ),
                  const SizedBox(height: 16),
                  const InfoCard(
                    title: 'regular_walking',
                    description: 'walk_daily_improve',
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
