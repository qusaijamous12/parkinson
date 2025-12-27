
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';
import '../../../shared/contstant/color_manager.dart';
import '../../../shared/contstant/values_manager.dart';
import '../../../shared/widget/app_bar.dart';
import '../../../shared/widget/my_button.dart';
import 'widgets/instruction_card.dart';
import 'widgets/result_card.dart';


class TremorTestScreen extends StatefulWidget {
  const TremorTestScreen({super.key});

  @override
  State<TremorTestScreen> createState() => _TremorTestScreenState();
}

class _TremorTestScreenState extends State<TremorTestScreen> {
  StreamSubscription<AccelerometerEvent>? _subscription;
  Timer? _timer;

  final List<double> _values = [];

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
      final magnitude =
      sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
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

    if (avg < 11) {
      _result = 'low_tremor_detected'.tr;
    } else if (avg < 13) {
      _result = 'moderate_tremor_detected'.tr;
    } else {
      _result = 'high_tremor_detected'.tr;
    }

    setState(() {
      _isTesting = false;
      _secondsLeft = 0;
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
          const ScreenAppBar(title: 'tremor_test'),
          Padding(
            padding: const EdgeInsets.all(AppPadding.kPadding),
            child: Column(
              children: [

                const InstructionCard(),

                const SizedBox(height: AppPadding.kPadding),

                // Countdown Circle
                if (_isTesting)
                  Container(
                    height: 180,
                    width: 180,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: ColorManager.kPrimary.withOpacity(0.2),
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        _secondsLeft > 0 ? '$_secondsLeft' : 'Done',
                        style:  TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: ColorManager.kPrimary,
                        ),
                      ),
                    ),
                  ),

                if (!_isTesting && _result == null)
                  Icon(
                    Icons.vibration,
                    size: 100,
                    color: ColorManager.kPrimary.withOpacity(0.6),
                  ),

                const SizedBox(height: 40),


                MyBtn(
                  fullWidth: true,
                  onTap: _isTesting ? null : _startTest,
                  title: _isTesting ? 'Testing...' : 'Start Tremor Test',
                ),

                const SizedBox(height: 30),


                if (_result != null)
                  ResultCard(result: _result!,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
