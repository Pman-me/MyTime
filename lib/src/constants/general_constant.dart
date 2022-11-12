import 'package:flutter/material.dart';

const String kTimerMethodChannel = 'timerMethodChannel';
const String kTick='tick';

const String kMethodChannelActionPlay = 'play';
const String kMethodChannelActionPause = 'pause';
const String kMethodChannelActionReset = 'reset';
const String kMethodChannelWasTimerRunning = 'wasTimerRunning';

GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldState> kScaffoldKey = GlobalKey<ScaffoldState>();

const String kApiKeySecureStorageKey = 'apiKey';
const double kAppbarHeight = 56;
const double kButtonHeight = 56;

const String kTimeEntryDateFormat='yyyy-MM-ddThh:mm:ss';
const String kTimeEntryDefaultDescription='From app, should set';
