import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/entities/banner.dart';
import 'package:e_commerce_app/modules/home/domain/repository/home_base_repository.dart';

class HomeGetBannersUseCase {
  final HomeBaseRepository homeBaseRepository;

  HomeGetBannersUseCase(this.homeBaseRepository);

  Future<Either<Failure, List<Banner>>> call() async => await homeBaseRepository.getBanners();
}