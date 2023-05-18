import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/authentication/domain/entities/login.dart';
import 'package:e_commerce_app/authentication/domain/entities/register.dart';
import 'package:e_commerce_app/authentication/domain/entities/user.dart';
import 'package:e_commerce_app/core/error/failure.dart';

abstract class AuthenticationBaseRepository {
  Future<Either<Failure, User>> loginUser(Login login);

  Future<Either<Failure, User>> registerUser(Register register);
}
