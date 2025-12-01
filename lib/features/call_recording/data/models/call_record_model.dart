import 'package:callspy/domain/entities/call_record.dart';

class CallRecordModel extends CallRecord {
  CallRecordModel({
    required super.id,
    required super.caller,
    required super.receiver,
    required super.callDuration,
    required super.callTimestamp,
  });

  factory CallRecordModel.fromJson(Map<String, dynamic> json) {
    return CallRecordModel(
      id: json['id'],
      caller: json['caller'],
      receiver: json['receiver'],
      callDuration: json['callDuration'],
      callTimestamp: DateTime.parse(json['callTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'caller': caller,
      'receiver': receiver,
      'callDuration': callDuration,
      'callTimestamp': callTimestamp.toIso8601String(),
    };
  }
}
