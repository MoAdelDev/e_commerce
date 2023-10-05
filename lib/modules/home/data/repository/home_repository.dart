import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';
import 'package:e_commerce_app/modules/authentication/domain/entities/user.dart';
import 'package:e_commerce_app/modules/home/data/datasource/home_local_datasource.dart';
import 'package:e_commerce_app/modules/home/data/datasource/home_remote_datasource.dart';
import 'package:e_commerce_app/modules/home/data/models/cart_model.dart';
import 'package:e_commerce_app/modules/home/domain/entities/banner.dart';
import 'package:e_commerce_app/modules/home/domain/entities/category.dart';
import 'package:e_commerce_app/modules/home/domain/entities/favorite.dart';
import 'package:e_commerce_app/modules/home/domain/entities/product.dart';
import 'package:e_commerce_app/modules/home/domain/repository/base_home_repository.dart';

class HomeRepository extends BaseHomeRepository {
  final BaseHomeRemoteDataSource baseHomeDataSource;
  final BaseHomeLocalDataSource baseHomeLocalDataSource;

  HomeRepository(this.baseHomeDataSource, this.baseHomeLocalDataSource);

  @override
  Future<Either<Failure, List<Product>>> getProducts() async {
    try {
      return Right(await baseHomeDataSource.getProducts());
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
        await baseHomeDataSource.getUser(),
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
      final result = await baseHomeDataSource.getBanners();
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
      final result = await baseHomeDataSource.getCategories();
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
      final result = await baseHomeDataSource.getFavorites();
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
  Future<Either<Failure, String>> changeFavorite({required productId}) async {
    try {
      final result = await baseHomeDataSource.changeFavorite(
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
          await baseHomeDataSource.removeFavorites(favoriteId: favoriteId);
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
          await baseHomeDataSource.getProductDetails(productId: productId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> addProductToCart({required productId}) async {
    try {
      final result =
          await baseHomeDataSource.addProductToCart(productId: productId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure(e.errorMessageModel.errorMessage),
      );
    }
  }

  @override
  Future<Either<Failure, CartModel>> getCart() async {
    try {
      final result = await baseHomeDataSource.getCarts();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> updateCart(
      {required int cartId, required int quantity}) async {
    try {
      final result = await baseHomeDataSource.updateCart(
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
      final result = await baseHomeDataSource.deleteProductFromCart(
        cartId: cartId,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<Product>>> getCategoryDetails(
      {required categoryId}) async {
    try {
      final result =
          await baseHomeDataSource.getCategoryDetails(categoryId: categoryId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> changeLanguage(
      {required String language}) async {
    try {
      final result =
          await baseHomeLocalDataSource.changeLanguage(language: language);
      return Right(result);
    } on ServerException catch (e) {
      return Left(LocalDatabaseFailure(e.errorMessageModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> changeNightMode({required bool isDark}) async {
    try {
      final result =
          await baseHomeLocalDataSource.changeNightMode(isDark: isDark);
      return Right(result);
    } on ServerException catch (e) {
      return Left(LocalDatabaseFailure(e.errorMessageModel.errorMessage));
    }
  }
}
