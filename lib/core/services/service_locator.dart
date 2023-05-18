import 'package:e_commerce_app/authentication/data/datasource/auth_datasource.dart';
import 'package:e_commerce_app/authentication/domain/repository/authentication_base_repository.dart';
import 'package:e_commerce_app/authentication/domain/usecases/login_usecase.dart';
import 'package:e_commerce_app/authentication/domain/usecases/register_usecase.dart';
import 'package:e_commerce_app/authentication/presentation/controller/login/login_bloc.dart';
import 'package:e_commerce_app/authentication/presentation/controller/register/register_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../authentication/data/repository/auth_repository.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    /// BLOC
    sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));
    sl.registerFactory<RegisterBloc>(() => RegisterBloc(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<AuthBaseRemoteDataSource>(
        () => AuthRemoteDataSource());

    /// REPOSITORY
    sl.registerLazySingleton<AuthenticationBaseRepository>(
        () => AuthRepository(sl()));

    ///  USE CASES
    sl.registerLazySingleton<LoginUseCase>(() => LoginUseCase(sl()));
    sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(sl()));
  }
}
