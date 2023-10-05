import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';

import '../entities/login.dart';
import '../entities/register.dart';
import '../entities/user.dart';

abstract class BaseAuthenticationRepository {
  Future<Either<Failure, User>> loginUser(Login login);

  Future<Either<Failure, User>> registerUser(Register register);
}
