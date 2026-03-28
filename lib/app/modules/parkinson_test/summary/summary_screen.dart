import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import 'test_summary_storage.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({super.key});

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  final List<String> _labels = const [
    'physical',
    'emotional',
    'cognitive',
    'tremor',
    'memory',
    'voice',
  ];

  late Map<String, double> _scores;

  @override
  void initState() {
    super.initState();
    _scores = TestSummaryStorage.loadScores();
  }

  double get _totalScore {
    if (_scores.isEmpty) return 0;
    return _scores.values.reduce((a, b) => a + b) / _scores.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 30, left: 20, right: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  ColorManager.kPrimary,
                  const Color(0xff6A8DFF),
                ],
              ),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: Get.back,
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
                    Text(
                      'test_results'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'summary_title'.tr,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 15,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'summary_total'.tr,
                          style: getMediumTextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 15),
                        ModernScoreCircle(
                          percentage: _totalScore,
                          size: 150,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _labels.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      final label = _labels[index];
                      return ScoreCard(
                        label: label.tr,
                        percentage: _scores[label] ?? 0,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'summary_timestamp'.trArgs([
                      '${DateTime.now().hour}:${DateTime.now().minute.toString().padLeft(2, '0')}'
                    ]),
                    style: getRegulerTextStyle(color: ColorManager.greyColor),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ModernScoreCircle extends StatelessWidget {
  final double percentage;
  final double size;

  const ModernScoreCircle({
    super.key,
    required this.percentage,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: percentage,
              strokeWidth: 10,
              backgroundColor: Colors.grey.shade200,
              color: ColorManager.kPrimary,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${(percentage * 100).toStringAsFixed(0)}%',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'summary_overall'.tr,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ScoreCard extends StatelessWidget {
  final String label;
  final double percentage;

  const ScoreCard({
    super.key,
    required this.label,
    required this.percentage,
  });

  Color _getColor() {
    if (percentage > 0.75) return Colors.green;
    if (percentage > 0.4) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor();

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            value: percentage,
            strokeWidth: 6,
            color: color,
            backgroundColor: color.withOpacity(0.15),
          ),
          const SizedBox(height: 10),
          Text(
            '${(percentage * 100).toStringAsFixed(0)}%',
            style: getMediumTextStyle(color: Colors.black),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: getRegulerTextStyle(
              color: ColorManager.greyColor,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
