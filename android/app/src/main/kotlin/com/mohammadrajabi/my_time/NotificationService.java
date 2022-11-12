package com.mohammadrajabi.my_time;

import static android.content.Context.NOTIFICATION_SERVICE;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;

import androidx.core.app.NotificationCompat;

public class NotificationService {

    private static NotificationService instance;

    private NotificationService() {
    }

    public static NotificationService getInstance() {
        if (instance == null) {
            instance = new NotificationService();
        }
        return instance;
    }

    public Notification getNotification(Context context, String title, int iconId, String actionTitle, int actionIconId, String action) {
        Intent playOrPauseIntent = new Intent(context, StopWatchService.class);
        playOrPauseIntent.setAction(action);

        Intent startAppIntent = new Intent(context, MainActivity.class);
        startAppIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);

        PendingIntent startAppPendingIntent = PendingIntent.getActivity(context,0,startAppIntent,PendingIntent.FLAG_UPDATE_CURRENT | PendingIntent.FLAG_IMMUTABLE);


        PendingIntent pendingPlayOrPauseIntent = PendingIntent.getService(context, 0, playOrPauseIntent, 0);

        NotificationCompat.Builder notificationBuilder = new NotificationCompat.Builder(context, Constants.NOTIFICATION_CHANNEL_ID)
                .setContentTitle(title)
                .setSmallIcon(iconId)
                .setShowWhen(false)
                .setSilent(true)
                .setContentIntent(startAppPendingIntent)
                .addAction(actionIconId, actionTitle, pendingPlayOrPauseIntent);

        return notificationBuilder.build();

    }

    public void updateNotification(Context context, String title, int iconId, String actionTitle, int actionIconId, String action) {
        NotificationManager notificationManager = (NotificationManager) context.getSystemService(NOTIFICATION_SERVICE);
        notificationManager.notify(Constants.NOTIFICATION_ID, getNotification(context, title, iconId, actionTitle, actionIconId, action));
    }

}
