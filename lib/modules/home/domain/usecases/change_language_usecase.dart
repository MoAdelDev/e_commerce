import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

class ChangeLanguageUseCase {
  final BaseHomeRepository baseHomeRepository;

  ChangeLanguageUseCase(this.baseHomeRepository);

  Future<Either<Failure, void>> call({required String language}) async => await baseHomeRepository.changeLanguage(language: language);
}