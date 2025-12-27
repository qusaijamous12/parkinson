
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class TremorTestScreen extends StatefulWidget {
  const TremorTestScreen({super.key});

  @override
  State<TremorTestScreen> createState() => _TremorTestScreenState();
}

class _TremorTestScreenState extends State<TremorTestScreen> {
  StreamSubscription<AccelerometerEvent>? _subscription;
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
      final magnitude =
      sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
      _values.add(magnitude);
    });

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft == 0) {
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
    _isTesting = false;

    final avg =
        _values.reduce((a, b) => a + b) / (_values.isEmpty ? 1 : _values.length);

    if (avg < 11) {
      _result = 'Low tremor detected';
    } else if (avg < 13) {
      _result = 'Moderate tremor detected';
    } else {
      _result = 'High tremor detected';
    }

    setState(() {});
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tremor Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Hold your phone steady in your hand.\nRemain still during the test.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),

            if (_isTesting)
              Text(
                '$_secondsLeft',
                style:
                const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: _isTesting ? null : _startTest,
              child: const Text('Start Tremor Test'),
            ),

            const SizedBox(height: 30),

            if (_result != null)
              Column(
                children: [
                  const Icon(Icons.analytics, size: 40),
                  const SizedBox(height: 10),
                  Text(
                    _result!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'This test is not a medical diagnosis.\nPlease consult a doctor.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
