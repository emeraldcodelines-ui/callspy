abstract class CallRecordingRepository {
  Future<void> startRecording();
  Future<void> stopRecording();
  Future<List<dynamic>> getCallRecords();
}
