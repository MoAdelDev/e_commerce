import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/product.dart';
import 'package:e_commerce_app/modules/shop/domain/repository/home_base_repository.dart';

class GetProductsUseCase {
  final HomeBaseRepository homeBaseRepository;

  GetProductsUseCase(this.homeBaseRepository);

  Future<Either<Failure, List<Product>>> call() async =>
      await homeBaseRepository.getProducts();
}
