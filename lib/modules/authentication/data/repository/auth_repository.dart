import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';

import '../../domain/entities/login.dart';
import '../../domain/entities/register.dart';
import '../../domain/repository/authentication_base_repository.dart';
import '../datasource/auth_datasource.dart';
import '../models/user_model.dart';

class AuthRepository extends AuthenticationBaseRepository {
  AuthBaseRemoteDataSource baseRemoteDataSource;

  AuthRepository(this.baseRemoteDataSource);

  @override
  Future<Either<Failure, UserModel>> loginUser(Login login) async {
    try {
      final result = await baseRemoteDataSource.loginUser(login);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, UserModel>> registerUser(Register register) async {
    try {
      final result = await baseRemoteDataSource.registerUser(register);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.errorMessage),
      );
    }
  }
}
