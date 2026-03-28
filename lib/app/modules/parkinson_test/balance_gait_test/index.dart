import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';

import '../../../shared/contstant/values_manager.dart';
import '../../../shared/widget/app_bar.dart';
import '../../../shared/widget/my_button.dart';
import '../summary/test_summary_storage.dart';

class BalanceGaitTestScreen extends StatefulWidget {
  const BalanceGaitTestScreen({super.key});

  @override
  State<BalanceGaitTestScreen> createState() => _BalanceGaitTestScreenState();
}

class _BalanceGaitTestScreenState extends State<BalanceGaitTestScreen> {
  StreamSubscription<AccelerometerEvent>? _subscription;
  Timer? _timer;
  List<double> _values = [];

  bool _isTesting = false;
  int _secondsLeft = 10;
  String? _result;

  void _startTest() {
    _values.clear();
    _secondsLeft = 10;
    _result = null;

    setState(() {
      _isTesting = true;
    });

    _subscription = accelerometerEvents.listen((event) {
      final magnitude = sqrt(
        event.x * event.x + event.y * event.y + event.z * event.z,
      );
      _values.add(magnitude);
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft <= 1) {
        timer.cancel();
        _stopTest();
      } else {
        setState(() {
          _secondsLeft--;
        });
      }
    });
  }

  void _stopTest() {
    _subscription?.cancel();
    _timer?.cancel();

    final avg = _values.isEmpty
        ? 0
        : _values.reduce((a, b) => a + b) / _values.length;
    final physicalScore = ((13 - avg) / 1.5).clamp(0, 1).toDouble();

    if (avg < 11.5) {
      _result = 'Good balance';
    } else if (avg < 13) {
      _result = 'Moderate imbalance';
    } else {
      _result = 'High imbalance detected';
    }

    setState(() {
      _isTesting = false;
      _secondsLeft = 0;
    });

    TestSummaryStorage.saveScores({
      'physical': physicalScore,
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const ScreenAppBar(title: 'balance_gait_test'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.kPadding),
              child: Column(
                children: [
                   Text(
                    'place_your_phone'.tr,
                    textAlign: TextAlign.center,
                    style:const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 40),

                  if (_isTesting)
                    Text(
                      '$_secondsLeft',
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  const SizedBox(height: 40),

                  MyBtn(
                    title: _isTesting ? 'testing'.tr : 'start_test'.tr,
                    onTap: _isTesting ? null : _startTest,
                  ),

                  const SizedBox(height: 30),

                  if (_result != null)
                    Column(
                      children: [
                        const Icon(
                          Icons.monitor_heart,
                          size: 40,
                          color: Colors.green,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          _result!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                         Text(
                          'this_tests'.tr,
                          textAlign: TextAlign.center,
                          style:const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
