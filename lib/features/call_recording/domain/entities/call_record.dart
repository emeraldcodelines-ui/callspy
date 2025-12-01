class CallRecord {
  final String id;
  final String phoneNumber;
  final DateTime timestamp;
  final String audioFilePath;

  CallRecord({
    required this.id,
    required this.phoneNumber,
    required this.timestamp,
    required this.audioFilePath,
  });
}
