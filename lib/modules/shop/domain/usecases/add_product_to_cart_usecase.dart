import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/shop/domain/repository/home_base_repository.dart';

class AddProductToCartUseCase {
  final HomeBaseRepository homeBaseRepository;

  AddProductToCartUseCase(this.homeBaseRepository);

  Future<Either<Failure, String>> call({required productId}) async =>
      homeBaseRepository.addProductToCart(productId: productId);
}
