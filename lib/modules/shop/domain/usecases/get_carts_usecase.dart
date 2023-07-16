import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/cart.dart';
import 'package:e_commerce_app/modules/shop/domain/repository/home_base_repository.dart';

class GetCartsUseCase {
  final HomeBaseRepository homeBaseRepository;

  GetCartsUseCase(this.homeBaseRepository);

  Future<Either<Failure, List<Cart>>> call() async => await homeBaseRepository.getCarts();
}