import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/data/remote/dio_helper.dart';
import 'package:e_commerce_app/core/theme/theme_data/theme_data_light.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home_bloc.dart';
import 'package:e_commerce_app/modules/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc_observer.dart';
import 'core/route/app_route.dart';
import 'core/services/service_locator.dart';
import 'modules/authentication/presentation/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await CacheHelper.init();
  await DioHelper.init();

  ServiceLocator().init();

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
          BlocProvider<HomeBloc>(
            create: (context) => sl()
              ..add(HomeGetProductsEvent())
              ..add(HomeGetUserEvent())
              ..add(HomeGetCategoriesEvent())
              ..add(HomeGetBannersEvent()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'E Commerce',
          theme: getThemeDataLight(),
          home: CacheHelper.getData(key: 'token').toString() == ''
              ? LoginScreen()
              : const HomeScreen(),
          onGenerateRoute: (settings) =>
              AppRoute.getInstance().generateRouter(settings),
        ),
      ),
    );
  }
}
