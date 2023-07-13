import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/authentication/domain/entities/user.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/banner.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/category.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/favorite.dart';
import 'package:e_commerce_app/modules/shop/domain/entities/product.dart';

abstract class HomeBaseRepository {
  Future<Either<Failure, List<Product>>> getProducts();

  Future<Either<Failure, List<BannerEntity>>> getBanners();

  Future<Either<Failure, List<Category>>> getCategories();

  Future<Either<Failure, User>> getUser();

  Future<Either<Failure, List<Favorite>>> getFavorites();

  Future<Either<Failure, Favorite>> changeFavorite({required productId});

  Future<Either<Failure, String>> removeFavorite({required favoriteId});

  Future<Either<Failure, Product>> getProductDetails({required productId});

}
