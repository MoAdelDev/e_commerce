import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/modules/authentication/domain/entities/user.dart';
import 'package:e_commerce_app/modules/shop/data/models/cart_model.dart';
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

  Future<Either<Failure, String>> changeFavorite({required productId});

  Future<Either<Failure, String>> removeFavorite({required favoriteId});

  Future<Either<Failure, Product>> getProductDetails({required productId});

  Future<Either<Failure, String>> addProductToCart({required productId});

  Future<Either<Failure, CartModel>> getCart();

  Future<Either<Failure, String>> updateCart(
      {required int cartId, required int quantity});

  Future<Either<Failure, String>> deleteProductFromCart({required int cartId});

  Future<Either<Failure, List<Product>>> getCategoryDetails(
      {required categoryId});
}
