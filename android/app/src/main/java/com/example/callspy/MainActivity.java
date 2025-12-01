package com.example.callspy;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.example.callspy/recorder";
    private CallRecorderManager callRecorderManager;

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        callRecorderManager = new CallRecorderManager();

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
            .setMethodCallHandler(
                (call, result) -> {
                    switch (call.method) {
                        case "startRecording":
                            callRecorderManager.startRecording();
                            result.success(null);
                            break;
                        case "stopRecording":
                            callRecorderManager.stopRecording();
                            result.success(null);
                            break;
                        default:
                            result.notImplemented();
                            break;
                    }
                }
            );
    }
}
