package com.example.callspy;

import android.media.MediaRecorder;
import android.util.Log;

public class CallRecorderManager {
    private MediaRecorder mediaRecorder;
    private boolean isRecording = false;

    public void startRecording(String outputFilePath) {
        if (isRecording) {
            Log.w("CallRecorderManager", "Recording is already in progress.");
            return;
        }

        mediaRecorder = new MediaRecorder();
        try {
            mediaRecorder.setAudioSource(MediaRecorder.AudioSource.MIC);
            mediaRecorder.setOutputFormat(MediaRecorder.OutputFormat.MPEG_4);
            mediaRecorder.setAudioEncoder(MediaRecorder.AudioEncoder.AAC);
            mediaRecorder.setOutputFile(outputFilePath);
            mediaRecorder.prepare();
            mediaRecorder.start();
            isRecording = true;
        } catch (Exception e) {
            Log.e("CallRecorderManager", "Failed to start recording", e);
            if (mediaRecorder != null) {
                mediaRecorder.release();
                mediaRecorder = null;
            }
            isRecording = false;
        }
    }

    public void stopRecording() {
        if (!isRecording) {
            Log.w("CallRecorderManager", "No recording in progress to stop.");
            return;
        }

        try {
            mediaRecorder.stop();
        } catch (Exception e) {
            Log.e("CallRecorderManager", "Failed to stop recording", e);
        } finally {
            mediaRecorder.release();
            mediaRecorder = null;
            isRecording = false;
        }
    }
}
