import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/home/domain/entities/favorite.dart';
import 'package:e_commerce_app/modules/home/domain/repository/home_base_repository.dart';

class HomeGetFavoritesUseCase{
  final HomeBaseRepository homeBaseRepository;

  HomeGetFavoritesUseCase(this.homeBaseRepository);

  Future<Either<Failure, List<Favorite>>> call() async => homeBaseRepository.getFavorites();
}