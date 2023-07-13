import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/modules/shop/presentation/screens/home_screen.dart';
import 'package:e_commerce_app/modules/shop/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

import '../../modules/authentication/presentation/screens/login_screen.dart';
import '../../modules/authentication/presentation/screens/register_screen.dart';

class AppRoute {
  static AppRoute getInstance() {
    return AppRoute();
  }

  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case registerScreen:
        return MaterialPageRoute(
          builder: (context) => RegisterScreen(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case productDetailsScreen:
        var args = settings.arguments as ScreenArgs;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(
            screenArgs: args,
          ),
        );
    }
    return null;
  }
}
