import 'package:get_it/get_it.dart';
import '../../modules/authentication/data/datasource/auth_datasource.dart';
import '../../modules/authentication/data/repository/auth_repository.dart';
import '../../modules/authentication/domain/repository/authentication_base_repository.dart';
import '../../modules/authentication/domain/usecases/login_usecase.dart';
import '../../modules/authentication/domain/usecases/register_usecase.dart';
import '../../modules/authentication/presentation/controller/login/login_bloc.dart';
import '../../modules/authentication/presentation/controller/register/register_bloc.dart';

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
