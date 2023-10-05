import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

class UpdateCartUseCase {
  final BaseHomeRepository homeBaseRepository;

  UpdateCartUseCase(this.homeBaseRepository);

  Future<Either<Failure, String>> call(
          {required cartId, required quantity}) async =>
      await homeBaseRepository.updateCart(cartId: cartId, quantity: quantity);
}
