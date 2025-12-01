import 'package:callspy/lib/features/call_recording/data/datasources/call_recording_data_source.dart';
import 'package:callspy/lib/features/call_recording/domain/repositories/call_recording_repository.dart';

class CallRecordingRepositoryImpl implements CallRecordingRepository {
  final CallRecordingDataSource dataSource;

  CallRecordingRepositoryImpl(this.dataSource);

  // Implement methods from CallRecordingRepository using dataSource
}
