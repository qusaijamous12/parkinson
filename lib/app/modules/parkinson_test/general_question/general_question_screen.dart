import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../../shared/widget/app_bar.dart';
import '../summary/test_summary_storage.dart';


class GeneralQuestionScreen extends StatefulWidget {
  const GeneralQuestionScreen({super.key});

  @override
  State<GeneralQuestionScreen> createState() => _GeneralQuestionScreenState();
}

class _GeneralQuestionScreenState extends State<GeneralQuestionScreen> {
  final List<_Question> _questions = const [
    _Question(key: 'general_question_mood'),
    _Question(key: 'general_question_sleep'),
    _Question(key: 'general_question_appetite'),
    _Question(key: 'general_question_concentration'),
  ];

  final List<String> _options = const [
    'general_option_awful',
    'general_option_poor',
    'general_option_ok',
    'general_option_good',
    'general_option_great',
  ];

  late Map<String, String> _answers;

  @override
  void initState() {
    super.initState();
    _answers = {
      for (final question in _questions) question.key: _options[0],
    };
  }

  void _selectOption(String questionKey, String optionKey) {
    setState(() {
      _answers[questionKey] = optionKey;
    });
  }

  void _saveTest() {
    const scoreMap = {
      'general_option_awful': 0.0,
      'general_option_poor': 0.25,
      'general_option_ok': 0.5,
      'general_option_good': 0.75,
      'general_option_great': 1.0,
    };

    final moodScore = scoreMap[_answers['general_question_mood']] ?? 0.0;
    final sleepScore = scoreMap[_answers['general_question_sleep']] ?? 0.0;
    final appetiteScore = scoreMap[_answers['general_question_appetite']] ?? 0.0;
    final concentrationScore =
        scoreMap[_answers['general_question_concentration']] ?? 0.0;

    TestSummaryStorage.saveScores({
      'emotional': moodScore,
      'physical': (sleepScore + appetiteScore) / 2,
      'cognitive': concentrationScore,
    });

    Get.snackbar(
      'general_question_saved'.tr,
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: ColorManager.kPrimary.withOpacity(0.1),
      colorText: ColorManager.kPrimary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.moreLightGrey,
      body: Column(
        children: [
          const ScreenAppBar(title: 'general_question'),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.all(AppPadding.kPadding),
              child: Column(
                children: [
                  Text(
                    'general_question_description'.tr,
                    style: getRegulerTextStyle(color: ColorManager.greyColor),
                  ),
                  SizedBox(height: AppPadding.kPadding,),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsetsDirectional.zero,
                      itemCount: _questions.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 14),
                      itemBuilder: (_, index) {
                        final question = _questions[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppPadding.kPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  question.key.tr,
                                  style: getSemiBoldTextStyle(color: Colors.black),
                                ),
                                const SizedBox(height: 12),
                                Wrap(
                                  spacing: AppPadding.kPadding / 2,
                                  runSpacing: AppPadding.kPadding / 2,
                                  children: _options
                                      .map(
                                        (optionKey) => ChoiceChip(
                                      label: Text(optionKey.tr),
                                      labelStyle: getRegulerTextStyle(
                                        color: _answers[question.key] == optionKey
                                            ? Colors.white
                                            : Colors.black54,
                                      ),
                                      selected: _answers[question.key] == optionKey,
                                      selectedColor: ColorManager.kPrimary,
                                      backgroundColor: Colors.grey.shade200,
                                      onSelected: (_) => _selectOption(question.key, optionKey),
                                    ),
                                  )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.kPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                      ),
                      onPressed: _saveTest,
                      child: Text(
                        'general_question_save'.tr,
                        style: getMediumTextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Question {
  final String key;
  const _Question({required this.key});
}
