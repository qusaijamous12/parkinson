import 'package:flutter/material.dart';

import '../../../data/model/test_question.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/style_manager.dart';
import '../../../shared/widget/app_bar.dart';

class SelfTestScreen extends StatefulWidget {
  final String testTitle;
  final List<TestQuestion> questions;

  const SelfTestScreen({
    super.key,
    required this.testTitle,
    required this.questions,
  });

  @override
  State<SelfTestScreen> createState() => _SelfTestScreenState();
}

class _SelfTestScreenState extends State<SelfTestScreen> {
  int currentIndex = 0;
  int totalScore = 0;

  void _nextQuestion(int score) {
    setState(() {
      totalScore += score;
      if (currentIndex < widget.questions.length - 1) {
        currentIndex++;
      } else {
        _showResult();
      }
    });
  }

  void _showResult() {
    String result;
    if (totalScore < 5) {
      result = 'Low risk';
    } else if (totalScore < 10) {
      result = 'Moderate risk';
    } else {
      result = 'High risk';
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Test Result'),
        content: Text('Your risk level: $result'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );

    setState(() {
      currentIndex = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[currentIndex];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ScreenAppBar(title: widget.testTitle),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${currentIndex + 1} of ${widget.questions.length}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Text(question.question, style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                ...List.generate(question.options.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(ColorManager.kPrimary)
                      ),
                      onPressed: () => _nextQuestion(question.scores[index]),
                      child: Text(question.options[index],style: getMediumTextStyle(color: Colors.white),),
                    ),
                  );
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
