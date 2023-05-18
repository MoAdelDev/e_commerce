import 'package:e_commerce_app/authentication/domain/entities/login.dart';
import 'package:e_commerce_app/authentication/domain/entities/user.dart';
import 'package:e_commerce_app/authentication/domain/repository/authentication_base_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';

class LoginUseCase {
  final AuthenticationBaseRepository baseLoginRepository;

  LoginUseCase(this.baseLoginRepository);

  Future<Either<Failure, User>> call(Login login) async {
    return await baseLoginRepository.loginUser(login);
  }
}
