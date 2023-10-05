import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/entities/product.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

class GetProductDetailsUseCase {
  final BaseHomeRepository homeBaseRepository;

  GetProductDetailsUseCase(this.homeBaseRepository);

  Future<Either<Failure, Product>> call({required productId}) async =>
      await homeBaseRepository.getProductDetails(productId: productId);
}
