import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

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
      final magnitude = sqrt(event.x * event.x + event.y * event.y + event.z * event.z);
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
      appBar: AppBar(title: const Text('Balance & Gait Test')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Place your phone at waist level or hold it in your hand.\nWalk slowly in a straight line or stand still.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 40),

            if (_isTesting)
              Text(
                '$_secondsLeft',
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: _isTesting ? null : _startTest,
              child: Text(_isTesting ? 'Testing...' : 'Start Test'),
            ),

            const SizedBox(height: 30),

            if (_result != null)
              Column(
                children: [
                  const Icon(Icons.monitor_heart, size: 40, color: Colors.green),
                  const SizedBox(height: 10),
                  Text(
                    _result!,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
