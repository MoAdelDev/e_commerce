import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/data/remote/dio_helper.dart';
import 'package:e_commerce_app/modules/authentication/domain/entities/user.dart';
import 'package:e_commerce_app/modules/on_boarding/on_boarding_screen.dart';
import 'package:e_commerce_app/modules/shop/presentation/controller/products/products_bloc.dart';
import 'package:e_commerce_app/modules/shop/presentation/controller/products/products_event.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/route/app_route.dart';
import 'core/services/service_locator.dart';
import 'core/style/themes.dart';
import 'generated/l10n.dart';
import 'modules/authentication/presentation/screens/login_screen.dart';
import 'modules/shop/presentation/screens/home/home_screen.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
  static Map<int, int> productCartQuantity = {};
  static bool isArabic = CacheHelper.getBool(key: 'isArabic') ?? false;

  const MyApp({super.key, required this.token});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider<ProductsBloc>(
            create: (context) => ProductsBloc(
              sl(),
              sl(),
              sl(),
              sl(),
              sl(),
              sl(),
              sl(),
            )
              ..add(HomeGetBannersEvent())
              ..add(HomeGetProductsEvent())
              ..add(HomeGetCategoriesEvent())
              ..add(HomeGetUserEvent()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme(context),
          home: token == '' ? const OnBoardingScreen() : HomeScreen(),
          onGenerateRoute: (settings) =>
              AppRoute.getInstance().generateRouter(settings),
          locale:
              isArabic ? const Locale('ar', 'EG') : const Locale('en', 'US'),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        ),
      ),
    );
  }
}
