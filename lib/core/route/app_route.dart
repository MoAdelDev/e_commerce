import 'package:e_commerce_app/core/route/route_string.dart';
import 'package:e_commerce_app/core/route/screen_args.dart';
import 'package:e_commerce_app/modules/addresses/presentation/screens/add_edit_address_screen.dart';
import 'package:e_commerce_app/modules/addresses/presentation/screens/adresses_screen.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/home/home_screen.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/home/search_products_screen.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/product_details/product_details_screen.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/settings/contacts_screen.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/settings/language_screen.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/settings/night_mode_screen.dart';
import 'package:e_commerce_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:e_commerce_app/modules/orders/presentation/screens/order_confirmation_screen.dart';
import 'package:e_commerce_app/modules/orders/presentation/screens/order_details_screen.dart';
import 'package:e_commerce_app/modules/orders/presentation/screens/orders_screen.dart';
import 'package:flutter/material.dart';

import '../../modules/authentication/presentation/screens/login_screen.dart';
import '../../modules/authentication/presentation/screens/register_screen.dart';
import '../../modules/home/presentation/screens/category_details/category_details_screen.dart';
import '../../modules/home/presentation/screens/settings/update_profile_screen.dart';

class AppRoute {
  static AppRoute getInstance() {
    return AppRoute();
  }

  Route? generateRouter(RouteSettings settings) {
    switch (settings.name) {
      case RouteConst.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
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
          builder: (context) => const HomeScreen(),
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
      case RouteConst.nightModeScreen:
        return MaterialPageRoute(
          builder: (context) => const NightModeScreen(),
        );
      case RouteConst.addressScreen:
        return MaterialPageRoute(
          builder: (context) => const AddressesScreen(),
        );

      case RouteConst.addOrUpdateAddressScreen:
        var args = settings.arguments as ScreenArgs;
        return MaterialPageRoute(
          builder: (context) => AddOrEditAddressScreen(
            screenArgs: args,
          ),
        );

      case RouteConst.updateProfileScreen:
        return MaterialPageRoute(
          builder: (context) => const UpdateProfileScreen(),
        );
      case RouteConst.contactsScreen:
        return MaterialPageRoute(
          builder: (context) => const ContactsScreen(),
        );

      case RouteConst.productsSearchScreen:
        return MaterialPageRoute(
          builder: (context) => ProductsSearchScreen(),
        );

      case RouteConst.orderConfirmationScreen:
        var args = settings.arguments as ScreenArgs;
        return MaterialPageRoute(
          builder: (context) => OrderConfirmationScreen(
            args: args,
          ),
        );

      case RouteConst.ordersScreen:
        return MaterialPageRoute(
          builder: (context) => const OrdersScreen(),
        );
      case RouteConst.orderDetailScreen:
        var args = settings.arguments as ScreenArgs;
        return MaterialPageRoute(
          builder: (context) => OrderDetailsScreen(
            args: args,
          ),
        );
    }
    return null;
  }
}
