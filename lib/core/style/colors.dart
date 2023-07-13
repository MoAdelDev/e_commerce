import 'package:flutter/material.dart';

class AppColorLight {
  static MaterialColor primaryColor =
      MaterialColorGenerator.from(const Color(0xff5727c6));
  static const Color primaryVariantColor = Color(0xff4510c0);
  static const Color secondaryColor = Color(0xffFF6600);
  static const Color secondaryVariantColor = Color(0xffe05A00);
  static const Color backgroundColor = Color(0xffE0E0E0);
  static const Color surfaceColor = Color(0xffEEEEEE);
  static const Color errorColor = Color(0xffD50000);
  static const Color onPrimaryColor = Color(0xffFFFFFF);
  static const Color onSecondaryColor = Color(0xffFFFFFF);
  static const Color onBackgroundColor = Color(0xff212121);
  static const Color onSurfaceColor = Color(0xff212121);
  static const Color onErrorColor = Color(0xffFFFFFF);
}
class MaterialColorGenerator {
  static MaterialColor from(Color color) {
    return MaterialColor(color.value, <int, Color>{
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color.withOpacity(1.0),
    });
  }
}
