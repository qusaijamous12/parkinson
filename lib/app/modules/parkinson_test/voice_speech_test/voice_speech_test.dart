import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../shared/contstant/values_manager.dart';
import '../../../shared/widget/app_bar.dart';
import '../../../shared/widget/my_button.dart';

class VoiceSpeechTest extends StatefulWidget {
  const VoiceSpeechTest({super.key});

  @override
  State<VoiceSpeechTest> createState() => _VoiceSpeechTestState();
}

class _VoiceSpeechTestState extends State<VoiceSpeechTest> {
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _isRecording = false;
  String _result = '';
  DateTime? _recordStartTime;

  @override
  void initState() {
    super.initState();
    _initRecorder();
  }

  Future<void> _initRecorder() async {
    await _recorder.openRecorder();
    await Permission.microphone.request();
  }

  @override
  void dispose() {
    _recorder.closeRecorder();
    super.dispose();
  }

  Future<void> _startRecording() async {
    _recordStartTime = DateTime.now();
    await _recorder.startRecorder(
      toFile: 'voice_test.aac',
      codec: Codec.aacADTS,
    );
    setState(() => _isRecording = true);
  }

  Future<void> _stopRecording() async {
    final path = await _recorder.stopRecorder();
    setState(() => _isRecording = false);

    if (path != null && _recordStartTime != null) {
      final durationInSeconds =
          DateTime.now().difference(_recordStartTime!).inSeconds;
      File audioFile = File(path);
      _analyzeLocally(audioFile, durationInSeconds);
    }
  }

  void _analyzeLocally(File file, int durationInSeconds) {
    double speechRate = durationInSeconds > 0 ? 60 / durationInSeconds : 0;

    setState(() {
      _result =
      '${'recording_duration'.tr} $durationInSeconds ${'sec'.tr}\n'
          '${'estimated_speech_rate'.tr} ${speechRate.toStringAsFixed(2)} ${'words/min'.tr}\n'
          '${'note_simple'.tr}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ScreenAppBar(title: 'voice_speech'.tr),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.kPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _result,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 50),
                  MyBtn(
                    onTap: _isRecording ? _stopRecording : _startRecording,
                    title: _isRecording ? 'stop_recording'.tr : 'start_recording'.tr,
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
