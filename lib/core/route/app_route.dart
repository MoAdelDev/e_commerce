import 'package:e_commerce_app/authentication/presentation/screens/register_screen.dart';
import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../authentication/presentation/screens/login_screen.dart';

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
    }
    return null;
  }
}
