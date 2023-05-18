import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/authentication/data/datasource/auth_datasource.dart';
import 'package:e_commerce_app/authentication/data/models/user_model.dart';
import 'package:e_commerce_app/authentication/domain/entities/login.dart';
import 'package:e_commerce_app/authentication/domain/entities/register.dart';
import 'package:e_commerce_app/authentication/domain/entities/user.dart';
import 'package:e_commerce_app/authentication/domain/repository/authentication_base_repository.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';

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
