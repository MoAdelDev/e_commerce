import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/shop/domain/repository/home_base_repository.dart';

class DeleteProductFromCartUseCase {
  final HomeBaseRepository homeBaseRepository;

  DeleteProductFromCartUseCase(this.homeBaseRepository);

  Future<Either<Failure, String>> call({required cartId}) async =>
      await homeBaseRepository.deleteProductFromCart(cartId: cartId);
}
