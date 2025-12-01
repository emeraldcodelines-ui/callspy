import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

abstract class CallRecordingDataSource {
  Future<void> startRecording();
  Future<void> stopRecording();
  Future<String> getRecordingFilePath();
  Future<List<String>> getCallRecords();
}

class CallRecordingDataSourceImpl implements CallRecordingDataSource {
  static const MethodChannel _channel = MethodChannel('com.example.callspy/recorder');

  @override
  Future<void> startRecording() async {
    await _channel.invokeMethod('startRecording');
  }

  @override
  Future<void> stopRecording() async {
    await _channel.invokeMethod('stopRecording');
  }

  @override
  Future<String> getRecordingFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/recording.aac';
  }

  @override
  Future<List<String>> getCallRecords() async {
    // Return a dummy list for now
    return ['recording1.aac', 'recording2.aac'];
  }
}
