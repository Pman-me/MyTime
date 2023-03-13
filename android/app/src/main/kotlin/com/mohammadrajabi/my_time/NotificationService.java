package com.mohammadrajabi.my_time;

import static android.content.Context.NOTIFICATION_SERVICE;

import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.graphics.Color;

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

    public Notification buildNotification(Context context, String title, int iconId, String actionTitle, int actionIconId, String action) {

        Intent playOrPauseIntent = new Intent(context, StopWatchService.class);
        playOrPauseIntent.setAction(action);

        Intent startAppIntent = new Intent(context, MainActivity.class);
        startAppIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);

        PendingIntent startAppPendingIntent;
        PendingIntent PlayOrPausePendingIntent;
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.M) {
            startAppPendingIntent = PendingIntent.getActivity(context, 0, startAppIntent, PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
            PlayOrPausePendingIntent = PendingIntent.getService(context, 0, playOrPauseIntent, PendingIntent.FLAG_IMMUTABLE);

        } else {
            startAppPendingIntent = PendingIntent.getActivity(context, 0, startAppIntent, 0);
            PlayOrPausePendingIntent = PendingIntent.getService(context, 0, playOrPauseIntent, 0);
        }


        NotificationCompat.Builder notificationBuilder = new NotificationCompat.Builder(context, Constants.NOTIFICATION_CHANNEL_ID)
                .setContentTitle(title)
                .setSmallIcon(iconId)
                .setShowWhen(false)
                .setColorized(true)
                .setColor(Color.parseColor("#92b4ef"))
                .setSilent(true)
                .setOngoing(true)
                .setContentIntent(startAppPendingIntent)
                .addAction(actionIconId, actionTitle, PlayOrPausePendingIntent);

        return notificationBuilder.build();

    }

    public void updateNotification(Context context, String title, int iconId, String actionTitle, int actionIconId, String action) {
        NotificationManager notificationManager = (NotificationManager) context.getSystemService(NOTIFICATION_SERVICE);
        notificationManager.notify(Constants.NOTIFICATION_ID, buildNotification(context, title, iconId, actionTitle, actionIconId, action));
    }

}
