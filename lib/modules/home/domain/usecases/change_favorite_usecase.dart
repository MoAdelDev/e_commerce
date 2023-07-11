import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/entities/favorite.dart';
import 'package:e_commerce_app/modules/home/domain/repository/home_base_repository.dart';

class ChangeFavoriteUseCase {
  final HomeBaseRepository homeBaseRepository;

  ChangeFavoriteUseCase(this.homeBaseRepository);

  Future<Either<Failure, Favorite>> call({required productId}) async =>
      homeBaseRepository.changeFavorite(productId: productId);
}