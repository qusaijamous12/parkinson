import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/test_question.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/widget/app_bar.dart';
import 'widgets/info_card.dart';
import 'widgets/self_test.dart';
import 'widgets/test_card.dart';
import 'widgets/tremor_test_screen.dart';

class ParkinsonTest extends StatelessWidget {
  const ParkinsonTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          body: Column(
            children: [
              // Custom App Bar
              const ScreenAppBar(title: 'Parkinson Tests'),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const InfoCard(
                        title: 'about_disease',
                        description: 'parkinson_effectively',
                      ),
                      const SizedBox(height: 16),

                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Playing audio about Parkinson...'),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: ColorManager.kPrimary,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              const BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.mic,
                                color: Colors.white,
                                size: 28,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'tap_talk_about'.tr,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      Text(
                        'self_assessment_tests'.tr,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),

                      TestCard(
                        title: 'tremor_test',
                        description: 'check_your_tremors',
                        onTap: () {
                          Get.to(()=>const TremorTestScreen());
                        },
                      ),
                      const SizedBox(height: 12),
                      TestCard(
                        title: 'balance_gait_test',
                        description: 'evaluate_your_balance',
                        onTap: () {},
                      ),
                      const SizedBox(height: 12),
                      TestCard(
                        title: 'voice_speech',
                        description: 'analyze_your_speech',
                        onTap: () {},
                      ),
                      const SizedBox(height: 24),

                      Text(
                        'tips_advice'.tr,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const InfoCard(
                        title: 'stay_active',
                        description: 'exercise',
                      ),
                      const SizedBox(height: 8),
                      const InfoCard(
                        title: 'healthy_diet',
                        description: 'balanced_diet',
                      ),
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
