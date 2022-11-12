package com.mohammadrajabi.my_time;


import android.app.Notification;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Intent;
import android.os.Binder;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;

import androidx.annotation.Nullable;
import androidx.lifecycle.Observer;


public class StopWatchService extends Service {

    private IBinder stopWatchBinder = new StopWatchBinder();

    private int elapsedTime = 0;
    private boolean isForegroundService = false;
    private Handler handler;
    private boolean isRunning = false;
    private Observer<Integer> observer;

    public int getElapsedTime() {
        return elapsedTime;
    }

    public boolean isRunning() {
        return isRunning;
    }

    @Override
    public void onCreate() {
        super.onCreate();

        observer = integer -> elapsedTime = integer;
        ElapsedTimeLiveData.getInstance().getElapsedTimeLiveData().observeForever(observer);
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        isForegroundService = true;
        isRunning = intent.getBooleanExtra(Constants.IS_RUNNING_EXTRA_KEY, false);
        Notification notification;

        if (isRunning) {
            notification = NotificationService.getInstance().getNotification(this,
                    toHoursMinutesSeconds(elapsedTime),
                    R.drawable.time,
                    Constants.NOTIFICATION_ACTION_PAUSE,
                    R.drawable.ic_stop,
                    Constants.NOTIFICATION_ACTION_PAUSE);
            playTimer();
        } else {
            notification = NotificationService.getInstance().getNotification(this,
                    toHoursMinutesSeconds(elapsedTime),
                    R.drawable.time,
                    Constants.NOTIFICATION_ACTION_PLAY,
                    R.drawable.ic_stop,
                    Constants.NOTIFICATION_ACTION_PLAY);
        }

        startForeground(Constants.NOTIFICATION_ID, notification);

        if (intent.getAction() != null) {

            if (intent.getAction().equals(Constants.NOTIFICATION_ACTION_PAUSE)) {

                NotificationService.getInstance().updateNotification(this,
                        toHoursMinutesSeconds(elapsedTime),
                        R.drawable.time,
                        Constants.NOTIFICATION_ACTION_PLAY,
                        R.drawable.ic_play,
                        Constants.NOTIFICATION_ACTION_PLAY);
                pauseTimer();

            } else if (intent.getAction().equals(Constants.NOTIFICATION_ACTION_PLAY)) {
                NotificationService.getInstance().updateNotification(this,
                        toHoursMinutesSeconds(elapsedTime),
                        R.drawable.time,
                        Constants.NOTIFICATION_ACTION_PAUSE,
                        R.drawable.ic_stop,
                        Constants.NOTIFICATION_ACTION_PAUSE);
                playTimer();

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
        if (handler != null) {
            handler.removeCallbacks(stopWatchTimer);
        }
        ElapsedTimeLiveData.getInstance().getElapsedTimeLiveData().removeObserver(observer);
        super.onDestroy();
    }


    public class StopWatchBinder extends Binder {

        public StopWatchService stopWatchService() {
            return StopWatchService.this;
        }
    }

    private void stopForegroundService() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            stopForeground(STOP_FOREGROUND_DETACH);
        } else {
            stopForeground(true);
        }
        NotificationManager notificationManager = (NotificationManager) this.getSystemService(NOTIFICATION_SERVICE);
        notificationManager.cancel(Constants.NOTIFICATION_ID);
    }

    private Runnable stopWatchTimer = new Runnable() {

        @Override
        public void run() {
            handler.postDelayed(this, 1000);

            elapsedTime++;

            if (isForegroundService) {
                NotificationService.getInstance().updateNotification(getBaseContext(),
                        toHoursMinutesSeconds(elapsedTime),
                        R.drawable.time,
                        Constants.NOTIFICATION_ACTION_PAUSE,
                        R.drawable.ic_stop,
                        Constants.NOTIFICATION_ACTION_PAUSE);
            }

            ElapsedTimeLiveData.getInstance().getElapsedTimeLiveData().postValue(elapsedTime);
        }
    };

    public void playTimer() {
        isRunning = true;
        handler = null;
        handler = new Handler(Looper.getMainLooper());
        stopWatchTimer.run();
    }

    public void pauseTimer() {
        isRunning = false;
        if (handler != null)
            handler.removeCallbacks(stopWatchTimer);
    }

    public void resetTimer() {
        elapsedTime = 0;
        pauseTimer();
        ElapsedTimeLiveData.getInstance().getElapsedTimeLiveData().postValue(elapsedTime);
    }

    private String toHoursMinutesSeconds(int elapsedTime) {
        int hour = (elapsedTime % 86400) / 3600;
        int minute = (elapsedTime % 86400 % 3600) / 60;
        int second = elapsedTime % 86400 % 3600 % 60;
        return String.format("%02d:%02d:%02d", hour, minute, second);
    }
}
