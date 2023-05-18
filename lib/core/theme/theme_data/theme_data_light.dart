import 'package:e_commerce_app/core/theme/app_color/app_color_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getThemeDataLight() => ThemeData(
      primaryColor: AppColorLight.primaryColor,
      primarySwatch: AppColorLight.primaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.2,
          iconTheme: IconThemeData(
            color: AppColorLight.appBarIconColor,
          ),
          titleTextStyle: TextStyle(
            fontSize: 20.0.sp,
            color: AppColorLight.primaryColor,
            fontWeight: FontWeight.w700,
          )),
      textTheme: getTextThemeData(),
      fontFamily: 'OpenSans',
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 14.0.sp,
            ),
          ),
          foregroundColor:
              MaterialStateProperty.all(AppColorLight.primaryColor),
          overlayColor: MaterialStateProperty.all(Colors.orange[200]),
        ),
      ),
    );

getTextThemeData() => TextTheme(
      bodyMedium: TextStyle(
        fontSize: 16.0.sp,
        color: AppColorLight.textBodyColor,
      ),
      bodySmall: TextStyle(
        fontSize: 14.0.sp,
        color: AppColorLight.textBodyColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 18.0.sp,
        color: AppColorLight.textBodyColor,
      ),
      titleSmall: TextStyle(
        fontSize: 16.0.sp,
        color: AppColorLight.primaryColor,
      ),
      titleMedium: TextStyle(
        fontSize: 18.0.sp,
        color: AppColorLight.primaryColor,
      ),
      titleLarge: TextStyle(
        fontSize: 20.0.sp,
        color: AppColorLight.primaryColor,
      ),
    );
