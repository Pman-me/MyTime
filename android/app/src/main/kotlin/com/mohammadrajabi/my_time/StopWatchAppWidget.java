package com.mohammadrajabi.my_time;

import static com.mohammadrajabi.my_time.Constants.IS_STOP_WATCH_RUNNING_EXTRA_KEY;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.view.View;
import android.widget.RemoteViews;


public class StopWatchAppWidget extends AppWidgetProvider {

    private final int REQUEST_CODE = 0;
    private boolean isStopWatchRunning = false;
    private int[] appWidgetIds;

    @Override
    public void onReceive(Context context, Intent intent) {
        super.onReceive(context, intent);
        if (intent.hasExtra(AppWidgetManager.EXTRA_APPWIDGET_IDS)) {
            isStopWatchRunning = intent.getBooleanExtra(IS_STOP_WATCH_RUNNING_EXTRA_KEY, false);
            onUpdate(context, AppWidgetManager.getInstance(context), AppWidgetManager.getInstance(context).getAppWidgetIds(
                    new ComponentName(context, StopWatchAppWidget.class)));
//            updateAppWidget(context, AppWidgetManager.getInstance(context), intent.getIntExtra(AppWidgetManager.EXTRA_APPWIDGET_IDS, 0), );
        }
    }

    @Override
    public void onUpdate(Context context, AppWidgetManager appWidgetManager, int[] appWidgetIds) {
        for (int i = 0; i < appWidgetIds.length; i++) {
            updateAppWidget(context, appWidgetManager, i, isStopWatchRunning);
        }

        super.onUpdate(context, appWidgetManager, appWidgetIds);
    }

    private void updateAppWidget(Context context, AppWidgetManager appWidgetManager, int appWidgetId, boolean isStopWatchInRunning) {

        Intent widgetPlayActionIntent = new Intent(context, StopWatchService.class);
        widgetPlayActionIntent.setAction(Constants.APP_WIDGET_ACTION_PLAY);
        widgetPlayActionIntent.putExtra(IS_STOP_WATCH_RUNNING_EXTRA_KEY, false);

        Intent widgetPauseActionIntent = new Intent(context, StopWatchService.class);
        widgetPauseActionIntent.setAction(Constants.APP_WIDGET_ACTION_PAUSE);

        PendingIntent widgetPlayActionPendingIntent;
        PendingIntent widgetPauseActionPendingIntent;

        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.S) {
            widgetPlayActionPendingIntent = PendingIntent.getService(context, REQUEST_CODE, widgetPlayActionIntent, PendingIntent.FLAG_IMMUTABLE);
            widgetPauseActionPendingIntent = PendingIntent.getService(context, REQUEST_CODE, widgetPauseActionIntent, PendingIntent.FLAG_IMMUTABLE);

        } else {
            widgetPlayActionPendingIntent = PendingIntent.getService(context, REQUEST_CODE, widgetPlayActionIntent, 0);

            widgetPauseActionPendingIntent = PendingIntent.getService(context, REQUEST_CODE, widgetPauseActionIntent, 0);
        }


        RemoteViews remoteViews = new RemoteViews(context.getPackageName(), R.layout.stop_watch_app_widget);

        if (isStopWatchInRunning) {
            remoteViews.setViewVisibility(R.id.play, View.GONE);
            remoteViews.setViewVisibility(R.id.pause, View.VISIBLE);
        } else {
            remoteViews.setViewVisibility(R.id.play, View.VISIBLE);
            remoteViews.setViewVisibility(R.id.pause, View.GONE);
        }

        remoteViews.setOnClickPendingIntent(R.id.play, widgetPlayActionPendingIntent);
        remoteViews.setOnClickPendingIntent(R.id.save, widgetPauseActionPendingIntent);

        appWidgetManager.updateAppWidget(appWidgetId, remoteViews);

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