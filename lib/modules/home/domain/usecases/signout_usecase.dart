import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

class SignOutUseCase {
  final BaseHomeRepository baseHomeRepository;

  SignOutUseCase(this.baseHomeRepository);

  Future<Either<Failure, String>> call() async => await baseHomeRepository.signOut();
}