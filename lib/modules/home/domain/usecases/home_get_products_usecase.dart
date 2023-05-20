import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/entities/product.dart';
import 'package:e_commerce_app/modules/home/domain/repository/home_base_repository.dart';

class HomeGetProductsUseCase {
  final HomeBaseRepository homeBaseRepository;

  HomeGetProductsUseCase(this.homeBaseRepository);

  Future<Either<Failure, List<Product>>> getProducts() async =>
      await homeBaseRepository.getProducts();
}
