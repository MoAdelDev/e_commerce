import 'package:e_commerce_app/modules/home/data/datasource/home_datasource.dart';
import 'package:e_commerce_app/modules/home/data/repository/home_repository.dart';
import 'package:e_commerce_app/modules/home/domain/repository/home_base_repository.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/home_get_banners_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/home_get_categories_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/home_get_products_usecase.dart';
import 'package:e_commerce_app/modules/home/domain/usecases/home_get_user_usecase.dart';
import 'package:get_it/get_it.dart';
import '../../modules/authentication/data/datasource/auth_datasource.dart';
import '../../modules/authentication/data/repository/auth_repository.dart';
import '../../modules/authentication/domain/repository/authentication_base_repository.dart';
import '../../modules/authentication/domain/usecases/login_usecase.dart';
import '../../modules/authentication/domain/usecases/register_usecase.dart';
import '../../modules/authentication/presentation/controller/login/login_bloc.dart';
import '../../modules/authentication/presentation/controller/register/register_bloc.dart';
import '../../modules/home/presentation/controller/home_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// BLOC
    sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
    sl.registerFactory<RegisterBloc>(() => RegisterBloc(sl()));
    sl.registerFactory<HomeBloc>(() => HomeBloc(sl(), sl(), sl(), sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<AuthBaseRemoteDataSource>(
        () => AuthRemoteDataSource());

    sl.registerLazySingleton<HomeBaseDataSource>(() => HomeDataSource());

    /// REPOSITORY
    sl.registerLazySingleton<AuthenticationBaseRepository>(
        () => AuthRepository(sl()));

    sl.registerLazySingleton<HomeBaseRepository>(() => HomeRepository(sl()));

    ///  USE CASES
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
    sl.registerLazySingleton<HomeGetProductsUseCase>(
        () => HomeGetProductsUseCase(sl()));
    sl.registerLazySingleton<HomeGetUserUseCase>(
        () => HomeGetUserUseCase(sl()));
    sl.registerLazySingleton<HomeGetBannersUseCase>(
        () => HomeGetBannersUseCase(sl()));
    sl.registerLazySingleton<HomeGetCategoriesUseCase>(
        () => HomeGetCategoriesUseCase(sl()));
  }
}
