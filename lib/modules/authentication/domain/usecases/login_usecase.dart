import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';

import '../entities/login.dart';
import '../entities/user.dart';
import '../repository/authentication_base_repository.dart';

class LoginUseCase {
  final AuthenticationBaseRepository baseLoginRepository;

  LoginUseCase(this.baseLoginRepository);

  Future<Either<Failure, User>> call(Login login) async {
    return await baseLoginRepository.loginUser(login);
  }
}