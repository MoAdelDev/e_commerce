import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/authentication/domain/entities/register.dart';
import 'package:e_commerce_app/authentication/domain/entities/user.dart';
import 'package:e_commerce_app/authentication/domain/repository/authentication_base_repository.dart';
import 'package:e_commerce_app/core/error/failure.dart';

class RegisterUseCase {
  final AuthenticationBaseRepository authenticationBaseRepository;

  RegisterUseCase(this.authenticationBaseRepository);

  Future<Either<Failure, User>> call(Register register) async {
    return await authenticationBaseRepository.registerUser(register);
  }
}
