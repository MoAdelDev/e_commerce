import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/data/remote/dio_helper.dart';
import 'package:e_commerce_app/core/theme/theme_data/theme_data_light.dart';
import 'package:e_commerce_app/modules/authentication/domain/entities/user.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/favorites/favorites_bloc.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/products/products_bloc.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/products/products_event.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/route/app_route.dart';
import 'core/services/service_locator.dart';
import 'modules/authentication/presentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();

  ServiceLocator().init();

  String? token = await CacheHelper.getData(key: 'token');
  if (kDebugMode) {
    print('token: ${await CacheHelper.getData(key: 'token')}');
  }

  runApp(MyApp(
    token: token,
  ));
}

class MyApp extends StatelessWidget {
  final String? token;
  static late User user;
  static Map<int, bool> favoriteMap = {};

  const MyApp({super.key, required this.token});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<ProductsBloc>(
            create: (context) => sl()
              ..add(HomeGetBannersEvent())
              ..add(HomeGetProductsEvent())
              ..add(HomeGetCategoriesEvent())
              ..add(HomeGetUserEvent()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E Commerce',
          theme: getThemeDataLight(),
          home: token == '' ? LoginScreen() : HomeScreen(),
          onGenerateRoute: (settings) =>
              AppRoute.getInstance().generateRouter(settings),
        ),
      ),
    );
  }
}
