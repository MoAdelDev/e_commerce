import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

class DeleteProductFromCartUseCase {
  final BaseHomeRepository homeBaseRepository;

  DeleteProductFromCartUseCase(this.homeBaseRepository);

  Future<Either<Failure, String>> call({required cartId}) async =>
      await homeBaseRepository.deleteProductFromCart(cartId: cartId);
}
