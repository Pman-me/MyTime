package com.mohammadrajabi.my_time;


import static com.mohammadrajabi.my_time.Constants.IS_STOP_WATCH_RUNNING_EXTRA_KEY;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.Build;
import android.os.IBinder;

import java.util.*;

import androidx.annotation.Nullable;
import androidx.lifecycle.Observer;


public class StopWatchService extends Service {

    private IBinder stopWatchBinder = new StopWatchBinder();

    private int elapsedTime = 0;
    private int systemElapsedTime = 0;
    private boolean isForegroundService = false;
    private boolean isStopWatchRunning = false;
    private Observer<Integer> elapsedTimeObserver;
    public Timer stopwatchTimer;
    private long startTimeMillis;
    private SharePref sharePref;

    public boolean isStopWatchRunning() {
        return isStopWatchRunning;
    }

    @Override
    public void onCreate() {
        super.onCreate();
        elapsedTimeObserver = integer -> elapsedTime = integer;
        ElapsedTimeLiveData.getInstance().getElapsedTimeLiveData().observeForever(elapsedTimeObserver);

        sharePref = SharePref.getInstance(getApplicationContext());
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        isForegroundService = true;
        isStopWatchRunning = intent.getBooleanExtra(IS_STOP_WATCH_RUNNING_EXTRA_KEY, false);
        Notification notification;

        if (isStopWatchRunning) {

            notification = NotificationService.getInstance().buildNotification(this,
                    toHoursMinutesSeconds(elapsedTime),
                    R.drawable.time,
                    Constants.NOTIFICATION_ACTION_PAUSE,
                    R.drawable.ic_stop,
                    Constants.NOTIFICATION_ACTION_PAUSE);

            scheduleTimeTask();

        } else {

            notification = NotificationService.getInstance().buildNotification(this,
                    toHoursMinutesSeconds(elapsedTime),
                    R.drawable.time,
                    Constants.NOTIFICATION_ACTION_PLAY,
                    R.drawable.ic_stop,
                    Constants.NOTIFICATION_ACTION_PLAY);
        }

        startForeground(Constants.NOTIFICATION_ID, notification);

        if (intent.getAction() != null) {

            switch (intent.getAction()) {
                case Constants.APP_WIDGET_ACTION_PAUSE:
                case Constants.NOTIFICATION_ACTION_PAUSE:
                    pauseTimer();
                    break;
                case Constants.APP_WIDGET_ACTION_PLAY:
                case Constants.NOTIFICATION_ACTION_PLAY:
                    playTimer();
                    break;
            }
        }

        return START_REDELIVER_INTENT;
    }


    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        stopWatchBinder = new StopWatchBinder();
        isForegroundService = false;
        stopForegroundService();
        return stopWatchBinder;
    }


    @Override
    public void onDestroy() {
        if (stopwatchTimer != null) {
            stopwatchTimer.cancel();
        }

        isForegroundService = false;
        ElapsedTimeLiveData.getInstance().getElapsedTimeLiveData().removeObserver(elapsedTimeObserver);
        super.onDestroy();
    }


    public class StopWatchBinder extends Binder {

        public StopWatchService stopWatchService() {
            return StopWatchService.this;
        }
    }


    void stopForegroundService() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            stopForeground(STOP_FOREGROUND_DETACH);
        } else {
            stopForeground(true);
        }
        NotificationManager notificationManager = (NotificationManager) this.getSystemService(NOTIFICATION_SERVICE);
        notificationManager.cancel(Constants.NOTIFICATION_ID);
    }

    private void scheduleTimeTask() {
        stopwatchTimer = new Timer();
        stopwatchTimer.scheduleAtFixedRate(new TimerTask() {
            @Override
            public void run() {
                elapsedTime++;
                ElapsedTimeLiveData.getInstance().getElapsedTimeLiveData().postValue(elapsedTime);
                if (isForegroundService) {
                    NotificationService.getInstance().updateNotification(getBaseContext(),
                            toHoursMinutesSeconds(elapsedTime),
                            R.drawable.time,
                            Constants.NOTIFICATION_ACTION_PAUSE,
                            R.drawable.ic_stop,
                            Constants.NOTIFICATION_ACTION_PAUSE);
                }
            }
        }, 0, 1000);
    }

    public void playTimer() {

        if (!isStopWatchRunning) {
            isStopWatchRunning = true;
            scheduleTimeTask();

            startTimeMillis = System.currentTimeMillis();
            sharePref.setStartTimeMillis(startTimeMillis);
            sharePref.setSystemTimeElapsed(elapsedTime);


//            AppWidgetManager appWidgetManager = AppWidgetManager.getInstance(StopWatchService.this);
//
//            int[] ids = appWidgetManager.getAppWidgetIds(
//                    new ComponentName(StopWatchService.this, StopWatchAppWidget.class));
//
//            Intent updateIntent = new Intent(AppWidgetManager.ACTION_APPWIDGET_UPDATE);
//            updateIntent.putExtra(IS_STOP_WATCH_RUNNING_EXTRA_KEY, true);
//            updateIntent.putExtra(AppWidgetManager.EXTRA_APPWIDGET_IDS, R.id.pause);
//            sendBroadcast(updateIntent);
//        handler = new Handler(Looper.getMainLooper());
//        stopWatchTimer.run();
        }
    }

    public void pauseTimer() {

        stopwatchTimer.cancel();

        if (isStopWatchRunning) {
            long endTimeMillis = System.currentTimeMillis();
            startTimeMillis = sharePref.getStartTimeMillis();
            systemElapsedTime = sharePref.getSystemTimeElapsed();

            systemElapsedTime += ((int) ((endTimeMillis - startTimeMillis) / 1000));
            elapsedTime = systemElapsedTime;
        }
        isStopWatchRunning = false;

        if (isForegroundService) {
            NotificationService.getInstance().buildNotification(this,
                    toHoursMinutesSeconds(elapsedTime),
                    R.drawable.time,
                    Constants.NOTIFICATION_ACTION_PLAY,
                    R.drawable.ic_stop,
                    Constants.NOTIFICATION_ACTION_PLAY);

            ElapsedTimeLiveData.getInstance().getElapsedTimeLiveData().postValue(elapsedTime);
        }

    }

    public void resetTimer() {
        stopwatchTimer.cancel();
        elapsedTime = 0;
        systemElapsedTime = 0;
        isStopWatchRunning = false;
        ElapsedTimeLiveData.getInstance().getElapsedTimeLiveData().postValue(elapsedTime);
        sharePref.setSystemTimeElapsed(0);
        sharePref.setStartTimeMillis(0);
    }

    private String toHoursMinutesSeconds(int elapsedTime) {
        int hour = (elapsedTime % 86400) / 3600;
        int minute = (elapsedTime % 86400 % 3600) / 60;
        int second = elapsedTime % 86400 % 3600 % 60;
        return String.format("%02d:%02d:%02d", hour, minute, second);
    }
}
