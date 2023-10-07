import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/data/models/cart_model.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

class GetProductsCartUseCase {
  final BaseHomeRepository homeBaseRepository;

  GetProductsCartUseCase(this.homeBaseRepository);

  Future<Either<Failure, CartProductModel>> call() async =>
      await homeBaseRepository.getCart();
}
