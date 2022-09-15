import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_time/gen/colors.gen.dart';


ThemeData get lightTheme => ThemeData.light().copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorName.white,
        foregroundColor: ColorName.primaryTextColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark),
      ),
      colorScheme:  const ColorScheme.light(
        primary: ColorName.primaryColor,
        secondary: Colors.blue,
        onSecondary: ColorName.white,
        onPrimary: ColorName.white,
        surface: ColorName.white,
        onSurface: ColorName.primaryTextColor,
        onBackground: ColorName.primaryTextColor,
        background: ColorName.white
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: ColorName.primaryColor),
          ),
        ),
      ),
      textTheme: const TextTheme(
          headline6: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: ColorName.primaryTextColor),
          headline5: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: ColorName.primaryTextColor),
          headline4: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: ColorName.primaryTextColor),
          caption: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: ColorName.captionTextColor),
          subtitle1: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 18,
              color: ColorName.secondaryTextColor),
          subtitle2: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: ColorName.primaryTextColor),
          bodyText2: TextStyle(
              fontSize: 12,
              color: ColorName.secondaryTextColor),
        bodyText1: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
            color: ColorName.primaryTextColor,
        )

      ),
      iconTheme: const IconThemeData(color: Colors.black),
    );
