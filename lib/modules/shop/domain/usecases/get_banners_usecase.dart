import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/banner.dart';
import 'package:e_commerce_app/modules/shop/domain/repository/home_base_repository.dart';

class GetBannersUseCase {
  final HomeBaseRepository homeBaseRepository;

  GetBannersUseCase(this.homeBaseRepository);

  Future<Either<Failure, List<BannerEntity>>> call() async => await homeBaseRepository.getBanners();
}