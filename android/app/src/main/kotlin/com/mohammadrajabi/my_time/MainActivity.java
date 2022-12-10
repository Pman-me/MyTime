package com.mohammadrajabi.my_time;

import android.app.ActivityManager;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.lifecycle.Observer;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private MethodChannel timerMethodChannel;
    private StopWatchService stopWatchService;
    private boolean isBound = false;
    private Intent intent;


    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ElapsedTimeLiveData.getInstance().getElapsedTimeLiveData().observe(MainActivity.this, observer);

    }

    @Override
    protected void onStart() {
        super.onStart();
        createService();
    }

    private void createService() {
        intent = new Intent(MainActivity.this, StopWatchService.class);
        bindService(intent, serviceConnection, BIND_AUTO_CREATE);
    }

    @Override
    protected void onResume() {
        super.onResume();
        stopPreviousService();
    }

    private void stopPreviousService() {
        ActivityManager activityManager = (ActivityManager) getSystemService(ACTIVITY_SERVICE);
        for (ActivityManager.RunningServiceInfo serviceInfo : activityManager.getRunningServices(Integer.MAX_VALUE)) {
            if (serviceInfo.service.getClassName().equals(StopWatchService.class.getName())) {
                stopService(new Intent(getApplicationContext(), StopWatchService.class));
            }
        }
    }

    @Override
    protected void onPause() {
        boolean wasTimerStarted = stopWatchService.getElapsedTime() > 0;
        intent.putExtra(Constants.IS_RUNNING_EXTRA_KEY, stopWatchService.isStopWatchRunning());

        unbindService(serviceConnection);

        if (wasTimerStarted) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                startForegroundService(intent);
            } else {
                startService(intent);
            }
        }
        super.onPause();

    }

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        BinaryMessenger binaryMessenger = flutterEngine.getDartExecutor().getBinaryMessenger();
        timerMethodChannel = new MethodChannel(binaryMessenger, Constants.TIMER_METHOD_CHANNEL);
        timerMethodChannel.setMethodCallHandler((call, result) -> {
            Object resultMethodCall = null;

            switch (call.method) {
                case Constants.METHOD_CHANNEL_ACTION_PLAY:

                    if (isBound) {
                        stopWatchService.playTimer();
                    }
                    resultMethodCall = true;
                    break;
                case Constants.METHOD_CHANNEL_ACTION_PAUSE:

                    if (isBound) {
                        stopWatchService.pauseTimer();
                    }
                    resultMethodCall = true;

                    break;
                case Constants.METHOD_CHANNEL_ACTION_RESET:

                    if (isBound) {
                        stopWatchService.resetTimer();
                    }
                    resultMethodCall = true;

                    break;
                case Constants.METHOD_CHANNEL_WAS_TIMER_RUNNING:
                    int elapsedTime = stopWatchService.getElapsedTime();

                    if (!stopWatchService.isStopWatchRunning() && elapsedTime > 0) {
                        resultMethodCall = elapsedTime;
                    }

                    break;
            }

            result.success(resultMethodCall);
        });

    }

    private ServiceConnection serviceConnection = new ServiceConnection() {
        @Override
        public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
            StopWatchService.StopWatchBinder stopWatchBinder = (StopWatchService.StopWatchBinder) iBinder;
            stopWatchService = stopWatchBinder.stopWatchService();
            stopWatchService.stopForegroundService();
//            stopWatchService.pauseTimer();
//            stopWatchService.playTimer();
            isBound = true;
        }

        @Override
        public void onServiceDisconnected(ComponentName componentName) {
            stopWatchService = null;
            isBound = false;
        }
    };

    final Observer<Integer> observer = new Observer<Integer>() {
        @Override
        public void onChanged(Integer elapsedTime) {
            if (elapsedTime > 0) {
                timerMethodChannel.invokeMethod(Constants.TICK, elapsedTime);
            }
        }
    };

}
