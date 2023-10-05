import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

class ChangeNightModeUseCase {
  final BaseHomeRepository baseHomeRepository;

  ChangeNightModeUseCase(this.baseHomeRepository);

  Future<Either<Failure, void>> call({required bool isDark}) async =>
      await baseHomeRepository.changeNightMode(isDark: isDark);
}
