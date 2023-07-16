import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';
import 'package:e_commerce_app/modules/authentication/domain/entities/user.dart';
import 'package:e_commerce_app/modules/shop/data/datasource/home_datasource.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/banner.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/cart.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/category.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/favorite.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/product.dart';
import 'package:e_commerce_app/modules/shop/domain/repository/home_base_repository.dart';

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

  @override
  Future<Either<Failure, String>> removeFavorite({required favoriteId}) async {
    try {
      final result =
          await homeBaseDataSource.removeFavorites(favoriteId: favoriteId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, Product>> getProductDetails(
      {required productId}) async {
    try {
      final result =
          await homeBaseDataSource.getProductDetails(productId: productId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> addProductToCart({required productId}) async {
    try {
      final result =
          await homeBaseDataSource.addProductToCart(productId: productId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.errorMessageModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, List<Cart>>> getCart() async {
    try {
      final result = await homeBaseDataSource.getCarts();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> updateCart(
      {required int cartId, required int quantity}) async {
    try {
      final result = await homeBaseDataSource.updateCart(
        cartId: cartId,
        quantity: quantity,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> deleteProductFromCart(
      {required int cartId}) async {
    try {
      final result = await homeBaseDataSource.deleteProductFromCart(
        cartId: cartId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }
}
