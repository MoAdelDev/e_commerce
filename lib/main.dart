import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/data/local/data.dart';
import 'package:e_commerce_app/core/data/remote/dio_helper.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/addresses/presentation/controller/addresses_bloc.dart';
import 'package:e_commerce_app/modules/checkout/presentation/screens/payment_details_screen.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_bloc.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_event.dart';
import 'package:e_commerce_app/modules/home/presentation/controller/home/home_state.dart';
import 'package:e_commerce_app/modules/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/route/app_route.dart';
import 'core/services/service_locator.dart';
import 'core/style/themes.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc.observer = MyBlocObserver();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(
            sl(),
            sl(),
            sl(),
            sl(),
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
        BlocProvider<AddressesBloc>(
          create: (context) => AddressesBloc(
            sl(),
            sl(),
            sl(),
            sl(),
          )..add(const AddressesGetEvent()),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppData.isDark ? darkTheme(context) : lightTheme(context),
            home: const PayemtDetailsScreen(),
            onGenerateRoute: (settings) =>
                AppRoute.getInstance().generateRouter(settings),
            locale: AppData.language == Language.arabic.name
                ? const Locale('ar', 'EG')
                : const Locale('en', 'US'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
          );
        },
      ),
    );
  }
}
