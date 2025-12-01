import 'package:callspy/features/call_recording/domain/repositories/call_recording_repository.dart';

class RecordCallUseCase {
  final CallRecordingRepository _repository;

  RecordCallUseCase(this._repository);

  Future<void> execute() async {
    // Implement the recording logic here
    await _repository.recordCall();
  }
}
