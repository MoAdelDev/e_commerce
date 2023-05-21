import 'package:e_commerce_app/bloc_observer.dart';
import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/data/remote/dio_helper.dart';
import 'package:e_commerce_app/core/theme/theme_data/theme_data_light.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/favorites/favorites_bloc.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/products/products_bloc.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/route/app_route.dart';
import 'core/services/service_locator.dart';
import 'modules/authentication/presentation/screens/login_screen.dart';
import 'modules/home/presentation/controller/favorites/favorites_event.dart';
import 'modules/home/presentation/controller/products/products_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();

  ServiceLocator().init();

  if (kDebugMode) {
    print('token: ${await CacheHelper.getData(key: 'token')}');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
              ..add(HomeGetProductsEvent())
              ..add(HomeGetUserEvent())
              ..add(HomeGetCategoriesEvent())
              ..add(HomeGetBannersEvent()),
          ),
          BlocProvider<FavoritesBloc>(
            create: (context) => sl()..add(FavoritesGetEvent()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E Commerce',
          theme: getThemeDataLight(),
          home: CacheHelper.getData(key: 'token').toString() == ''
              ? LoginScreen()
              : HomeScreen(),
          onGenerateRoute: (settings) =>
              AppRoute.getInstance().generateRouter(settings),
        ),
      ),
    );
  }
}
