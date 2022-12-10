package com.mohammadrajabi.my_time;

import android.annotation.SuppressLint;
import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.Context;
import android.content.Intent;
import android.widget.RemoteViews;


public class StopWatchAppWidget extends AppWidgetProvider {

    private final String ACTION_WIDGET_PLAY = "Play";
    private final String ACTION_WIDGET_PAUSE = "Pause";
    private final int INTENT_FLAGS = 0;
    private final int REQUEST_CODE = 0;

    static void updateAppWidget(Context context, AppWidgetManager appWidgetManager,
                                int appWidgetId) {

        RemoteViews views = new RemoteViews(context.getPackageName(), R.layout.stop_watch_app_widget);

        appWidgetManager.updateAppWidget(appWidgetId, views);
    }

    @Override
    public void onUpdate(Context context, AppWidgetManager appWidgetManager, int[] appWidgetIds) {

        for (int i = 0; i < appWidgetIds.length; i++) {

            int appWidgetId = appWidgetIds[i];

            Intent playIntent = new Intent(context, StopWatchService.class);
            playIntent.setAction(Constants.APP_WIDGET_ACTION_PLAY);
            playIntent.putExtra(Constants.IS_RUNNING_EXTRA_KEY, false);

            Intent pauseIntent = new Intent(context, StopWatchService.class);
            pauseIntent.setAction(Constants.APP_WIDGET_ACTION_PAUSE);

            PendingIntent playPendingIntent = PendingIntent.getService(context, REQUEST_CODE, playIntent, INTENT_FLAGS);

            PendingIntent pausePendingIntent = PendingIntent.getService(context, REQUEST_CODE, pauseIntent, INTENT_FLAGS);

            RemoteViews remoteViews = new RemoteViews(context.getPackageName(), R.layout.stop_watch_app_widget);

            remoteViews.setOnClickPendingIntent(R.id.play_pause_fab, playPendingIntent);
            remoteViews.setOnClickPendingIntent(R.id.play_pause_fab, pausePendingIntent);

            appWidgetManager.updateAppWidget(appWidgetId, remoteViews);
        }

        super.onUpdate(context, appWidgetManager, appWidgetIds);
    }

    @Override
    public void onEnabled(Context context) {
        // Enter relevant functionality for when the first widget is created
    }

    @Override
    public void onDisabled(Context context) {
        // Enter relevant functionality for when the last widget is disabled
    }
}