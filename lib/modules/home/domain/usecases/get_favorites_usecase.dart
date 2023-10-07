import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/entities/favorite.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

class GetFavoritesUseCase{
  final BaseHomeRepository homeBaseRepository;

  GetFavoritesUseCase(this.homeBaseRepository);

  Future<Either<Failure, List<Favorite>>> call() async => await homeBaseRepository.getFavorites();
}