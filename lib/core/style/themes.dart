import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
import 'fonts.dart';

ThemeData lightTheme(context) => ThemeData(
      colorScheme: ColorScheme(
        primary: AppColorLight.primaryColor,
        primaryContainer: AppColorLight.primaryVariantColor,
        background: AppColorLight.backgroundColor,
        secondary: AppColorLight.secondaryColor,
        secondaryContainer: AppColorLight.secondaryVariantColor,
        error: AppColorLight.errorColor,
        surface: AppColorLight.surfaceColor,
        onSurface: AppColorLight.onSurfaceColor,
        onPrimary: AppColorLight.onPrimaryColor,
        onSecondary: AppColorLight.onSecondaryColor,
        onError: AppColorLight.onErrorColor,
        onBackground: AppColorLight.onBackgroundColor,
        brightness: Brightness.light,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 40,
          color: AppColorLight.onBackgroundColor,
          fontFamily: AppFonts.boldFont,
        ),
        titleMedium: TextStyle(
          fontSize: 30,
          color: AppColorLight.onBackgroundColor,
          fontFamily: AppFonts.boldFont,
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          color: AppColorLight.onBackgroundColor,
          fontFamily: AppFonts.boldFont,
        ),
        bodyLarge: TextStyle(
          fontSize: 18,
          color: AppColorLight.onBackgroundColor,
          fontFamily: AppFonts.regularFont,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          color: AppColorLight.onBackgroundColor,
          fontFamily: AppFonts.regularFont,
        ),
        bodySmall: TextStyle(
          fontSize: 14,
          color: AppColorLight.onBackgroundColor,
          fontFamily: AppFonts.regularFont,
        ),
        labelLarge: TextStyle(
          fontSize: 20,
          fontFamily: AppFonts.boldFont,
          color: AppColorLight.onPrimaryColor,
        ),
        labelMedium: TextStyle(
          fontSize: 18,
          fontFamily: AppFonts.semiBoldFont,
          color: AppColorLight.onPrimaryColor,
        ),
        labelSmall: TextStyle(
          fontSize: 16,
          fontFamily: AppFonts.semiBoldFont,
          color: AppColorLight.onPrimaryColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColorLight.backgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColorLight.primaryColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 30.0,
          color: AppColorLight.onBackgroundColor,
          fontFamily: AppFonts.boldFont,
        ),
        elevation: 1.0,
        iconTheme: const IconThemeData(
          color: AppColorLight.onBackgroundColor,
        ),
        titleSpacing: 10.0,
      ),
    );
