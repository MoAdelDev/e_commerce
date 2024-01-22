import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';

import '../entities/login.dart';
import '../entities/user.dart';
import '../repository/base_authentication_repository.dart';

class LoginUseCase {
  final BaseAuthenticationRepository baseLoginRepository;

  LoginUseCase(this.baseLoginRepository);

  Future<Either<Failure, User>> call(Login login) async {
    return await baseLoginRepository.loginUser(login);
  }
}
