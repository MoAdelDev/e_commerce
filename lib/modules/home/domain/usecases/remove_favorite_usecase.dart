import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/repository/home_base_repository.dart';

class RemoveFavoriteUseCase {
  final HomeBaseRepository homeBaseRepository;

  RemoveFavoriteUseCase(this.homeBaseRepository);

  Future<Either<Failure, String>> call({required favoriteId}) async {
    return homeBaseRepository.removeFavorite(favoriteId: favoriteId);
  }
}
