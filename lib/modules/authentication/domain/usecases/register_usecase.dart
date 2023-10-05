import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';

import '../entities/register.dart';
import '../entities/user.dart';
import '../repository/base_authentication_repository.dart';

class RegisterUseCase {
  final BaseAuthenticationRepository authenticationBaseRepository;

  RegisterUseCase(this.authenticationBaseRepository);

  Future<Either<Failure, User>> call(Register register) async {
    return await authenticationBaseRepository.registerUser(register);
  }
}
