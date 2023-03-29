package com.mohammadrajabi.my_time;


import android.content.Context;
import android.content.SharedPreferences;

public class SharePref {

    private static final String PREFS_NAME = "myTime_pref";
    private static final String KEY_SYSTEM_ELAPSED_TIME = "systemElapsedTime";
    private static final String KEY_START_TIME_MILLIS = "startTimeMillis";
    private static final String KEY_IS_STOPWATCH_RUNNING = "isStopWatchRunning";
    private static SharedPreferences sharedPreferences;
    private static SharePref mSharePref;

    private SharePref(){}

    public static SharePref getInstance(Context context) {
        if (mSharePref == null) {
            mSharePref = new SharePref();
            sharedPreferences = context.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
        }
        return mSharePref;
    }

    public int getSystemTimeElapsed() {
        return sharedPreferences.getInt(KEY_SYSTEM_ELAPSED_TIME, 0);
    }

    public void setSystemTimeElapsed(int systemTimeElapsed) {
        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.putInt(KEY_SYSTEM_ELAPSED_TIME, systemTimeElapsed);
        editor.apply();
    }

    public long getStartTimeMillis() {
        return sharedPreferences.getLong(KEY_START_TIME_MILLIS, 0);
    }

    public void setStartTimeMillis(long startTimeMillis) {
        SharedPreferences.Editor editor = sharedPreferences.edit();
        editor.putLong(KEY_START_TIME_MILLIS, startTimeMillis);
        editor.apply();
    }

}
