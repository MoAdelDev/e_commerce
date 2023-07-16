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
          fontSize: 28,
          color: AppColorLight.onBackgroundColor,
          fontFamily: AppFonts.regularFont,
        ),
        titleMedium: TextStyle(
          fontSize: 24,
          color: AppColorLight.onPrimaryColor,
          fontFamily: AppFonts.regularFont,
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          color: AppColorLight.onBackgroundColor,
          fontFamily: AppFonts.regularFont,
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
          fontSize: 18,
          fontFamily: AppFonts.mediumFont,
          color: AppColorLight.onPrimaryColor,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontFamily: AppFonts.mediumFont,
          color: AppColorLight.onPrimaryColor,
        ),
        labelSmall: TextStyle(
          fontSize: 14,
          fontFamily: AppFonts.mediumFont,
          color: AppColorLight.onPrimaryColor,
        ),
      ),
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppColorLight.primaryColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        titleTextStyle: const TextStyle(
          fontSize: 25.0,
          color: AppColorLight.onPrimaryColor,
          fontFamily: AppFonts.regularFont,
        ),
        elevation: 3.0,
        iconTheme: const IconThemeData(
          color: AppColorLight.onPrimaryColor,
        ),
        titleSpacing: 5.0,
      ),
    );
