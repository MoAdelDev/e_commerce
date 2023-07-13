import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/product.dart';
import 'package:e_commerce_app/modules/shop/domain/repository/home_base_repository.dart';

class GetProductDetailsUseCase {
  final HomeBaseRepository homeBaseRepository;

  GetProductDetailsUseCase(this.homeBaseRepository);

  Future<Either<Failure, Product>> call({required productId}) async =>
      await homeBaseRepository.getProductDetails(productId: productId);
}
