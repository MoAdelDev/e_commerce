import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/authentication/domain/entities/user.dart';
import 'package:e_commerce_app/modules/shop/domain/repository/home_base_repository.dart';

class GetUserUseCase {
  final HomeBaseRepository homeBaseRepository;

  GetUserUseCase(this.homeBaseRepository);

  Future<Either<Failure, User>> call() async =>
      await homeBaseRepository.getUser();
}
