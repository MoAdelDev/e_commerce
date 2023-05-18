import 'package:e_commerce_app/authentication/presentation/screens/login_screen.dart';
import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/theme/theme_data/theme_data_light.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc_observer.dart';
import 'core/route/app_route.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  await CacheHelper().init();

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
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E Commerce',
        theme: getThemeDataLight(),
        home: LoginScreen(),
        onGenerateRoute: (settings) =>
            AppRoute.getInstance().generateRouter(settings),
      ),
    );
  }
}
