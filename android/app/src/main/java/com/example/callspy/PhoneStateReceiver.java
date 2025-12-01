package com.example.callspy;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.telephony.TelephonyManager;
import android.util.Log;

public class PhoneStateReceiver extends BroadcastReceiver {

    private static final String TAG = "PhoneStateReceiver";

    @Override
    public void onReceive(Context context, Intent intent) {
        if (intent == null || intent.getAction() == null) {
            return;
        }

        if (intent.getAction().equals(TelephonyManager.ACTION_PHONE_STATE_CHANGED)) {
            String state = intent.getStringExtra(TelephonyManager.EXTRA_STATE);
            if (state == null) {
                return;
            }

            switch (state) {
                case TelephonyManager.EXTRA_STATE_OFFHOOK:
                    Log.d(TAG, "Phone state OFFHOOK - start recording");
                    CallRecorderManager.getInstance().startRecording();
                    break;
                case TelephonyManager.EXTRA_STATE_IDLE:
                    Log.d(TAG, "Phone state IDLE - stop recording");
                    CallRecorderManager.getInstance().stopRecording();
                    break;
                default:
                    // Other states like RINGING can be handled if needed
                    break;
            }
        }
    }
}
