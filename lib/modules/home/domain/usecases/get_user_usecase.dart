import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/authentication/domain/entities/user.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

class GetUserUseCase {
  final BaseHomeRepository homeBaseRepository;

  GetUserUseCase(this.homeBaseRepository);

  Future<Either<Failure, User>> call() async =>
      await homeBaseRepository.getUser();
}
