import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

class AddProductToCartUseCase {
  final BaseHomeRepository homeBaseRepository;

  AddProductToCartUseCase(this.homeBaseRepository);

  Future<Either<Failure, String>> call({required productId}) async =>
      homeBaseRepository.addProductToCart(productId: productId);
}
