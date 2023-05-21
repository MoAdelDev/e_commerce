import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';
import 'package:e_commerce_app/modules/authentication/domain/entities/user.dart';
import 'package:e_commerce_app/modules/home/data/datasource/home_datasource.dart';
import 'package:e_commerce_app/modules/home/domain/entities/banner.dart';
import 'package:e_commerce_app/modules/home/domain/entities/category.dart';
import 'package:e_commerce_app/modules/home/domain/entities/favorite.dart';
import 'package:e_commerce_app/modules/home/domain/entities/product.dart';
import 'package:e_commerce_app/modules/home/domain/repository/home_base_repository.dart';

class HomeRepository extends HomeBaseRepository {
  final HomeBaseDataSource homeBaseDataSource;

  HomeRepository(this.homeBaseDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      return Right(await homeBaseDataSource.getProducts());
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.errorMessageModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      return Right(
        await homeBaseDataSource.getUser(),
      );
    } on ServerException catch (error) {
      return Left(
        ServerFailure(error.errorMessageModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<BannerEntity>>> getBanners() async {
    try {
      final result = await homeBaseDataSource.getBanners();
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.errorMessageModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final result = await homeBaseDataSource.getCategories();
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.errorMessageModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<Favorite>>> getFavorites() async {
    try {
      final result = await homeBaseDataSource.getFavorites();
      return Right(
        result,
      );
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.errorMessageModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, Favorite>> changeFavorite({required productId}) async {
    try {
      final result = await homeBaseDataSource.changeFavorite(
        productId: productId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.errorMessageModel.errorMessage),
      );
    }
  }
}
