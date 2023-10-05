import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/home/home_screen.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/home/settings/language_screen.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/product_details/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../modules/authentication/presentation/screens/login_screen.dart';
import '../../modules/authentication/presentation/screens/register_screen.dart';
import '../../modules/home/presentation/screens/category_details/category_details_screen.dart';

class AppRoute {
  static AppRoute getInstance() {
    return AppRoute();
  }

  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case RouteConst.loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case RouteConst.registerScreen:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        );
      case RouteConst.homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case RouteConst.productDetailsScreen:
        var args = settings.arguments as ScreenArgs;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
            screenArgs: args,
          ),
        );
      case RouteConst.categoryDetailsScreen:
        var args = settings.arguments as ScreenArgs;
        return MaterialPageRoute(
          builder: (context) => CategoryDetailsScreen(
            screenArgs: args,
          ),
        );
      case RouteConst.languageScreen:
        return MaterialPageRoute(
          builder: (context) => const LanguageScreen(),
        );
    }
    return null;
  }
}
