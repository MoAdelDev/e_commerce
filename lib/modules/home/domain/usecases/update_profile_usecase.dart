import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/authentication/domain/entities/register.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

import '../../../../core/error/failure.dart';

class UpdateProfileUseCase {
  final BaseHomeRepository baseHomeRepository;

  const UpdateProfileUseCase(this.baseHomeRepository);

  Future<Either<Failure, String>> call({required Register register}) async =>
      await baseHomeRepository.updateProfile(register: register);
}
