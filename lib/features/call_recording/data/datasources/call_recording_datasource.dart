abstract class CallRecordingDataSource {
  /// Starts recording audio.
  Future<void> startRecording();

  /// Stops recording audio.
  Future<void> stopRecording();

  /// Returns the path to the recorded audio file.
  Future<String> getRecordingFilePath();

  /// Checks if the file system is accessible.
  Future<bool> isFileSystemAccessible();

  /// Deletes the recorded audio file.
  Future<void> deleteRecordingFile();
}