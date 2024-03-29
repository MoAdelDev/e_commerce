import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/data/remote/dio_helper.dart';
import 'package:e_commerce_app/core/error/error_message_model.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';
import 'package:e_commerce_app/core/network/api_constance.dart';
import 'package:e_commerce_app/modules/authentication/data/models/user_model.dart';
import 'package:e_commerce_app/modules/authentication/domain/entities/register.dart';
import 'package:e_commerce_app/modules/home/data/models/banner_model.dart';
import 'package:e_commerce_app/modules/home/data/models/category_model.dart';
import 'package:e_commerce_app/modules/home/data/models/product_model.dart';
import 'package:e_commerce_app/modules/home/data/models/search_model.dart';
import 'package:e_commerce_app/modules/home/domain/entities/product.dart';

import '../models/cart_model.dart';
import '../models/favorite_model.dart';

abstract class BaseHomeRemoteDataSource {
  Future<List<ProductModel>> getProducts();

  Future<List<BannerModel>> getBanners();

  Future<List<CategoryModel>> getCategories();

  Future<UserModel> getUser();

  Future<List<FavoriteModel>> getFavorites();

  Future<String> changeFavorite({required productId});

  Future<String> removeFavorites({required favoriteId});

  Future<ProductModel> getProductDetails({required productId});

  Future<String> addProductToCart({required productId});

  Future<CartProductModel> getCarts();

  Future<String> updateCart({required int cartId, required int quantity});

  Future<String> deleteProductFromCart({required int cartId});

  Future<List<Product>> getCategoryDetails({required categoryId});

  Future<String> signOut();

  Future<String> updateProfile({required Register register});

  Future<List<SearchModel>> searchProducts({required String query});
}

class HomeRemoteDataSource extends BaseHomeRemoteDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
    String? token = CacheHelper.getString(key: 'token');

    final result = await DioHelper.getData(
      path: ApiConstance.productsUrl,
      token: token,
    );

    if (result.data['status']) {
      return List<ProductModel>.from(
        (result.data['data']['data'] as List).map(
          (e) => ProductModel.fromJson(e),
        ),
      );
    }
    throw ServerException(
      ErrorMessageModel.fromJson(result.data['message']),
    );
  }

  @override
  Future<List<BannerModel>> getBanners() async {
    final result = await DioHelper.getData(path: ApiConstance.bannersUrl);
    if (result.data['status']) {
      return List.from(
        (result.data['data'] as List).map(
          (e) => BannerModel.fromJson(e),
        ),
      );
    }
    throw ServerException(
      ErrorMessageModel.fromJson(
        result.data['message'],
      ),
    );
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final result = await DioHelper.getData(path: ApiConstance.categoriesUrl);
    if (result.data['status']) {
      return List.from(
        (result.data['data']['data'] as List).map(
          (e) => CategoryModel.fomJson(e),
        ),
      );
    }
    throw ServerException(
      ErrorMessageModel.fromJson(
        result.data['message'],
      ),
    );
  }

  @override
  Future<UserModel> getUser() async {
    String? token = CacheHelper.getString(key: 'token');

    final result = await DioHelper.getData(
      path: ApiConstance.profileUrl,
      token: token,
    );
    if (result.data['status']) {
      return UserModel.fromJson(result.data['data']);
    }
    throw ServerException(
      ErrorMessageModel.fromJson(
        result.data,
      ),
    );
  }

  @override
  Future<List<FavoriteModel>> getFavorites() async {
    String? token = CacheHelper.getString(key: 'token');
    final result =
        await DioHelper.getData(path: ApiConstance.favoritesUrl, token: token);
    if (result.data['status']) {
      return List.from(
        (result.data['data']['data'] as List).map(
          (e) => FavoriteModel.fromJson(e),
        ),
      );
    }
    throw ServerException(
      ErrorMessageModel.fromJson(
        result.data['message'],
      ),
    );
  }

  @override
  Future<String> changeFavorite({required productId}) async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.postData(
      path: ApiConstance.favoritesUrl,
      data: {'product_id': productId},
      token: token,
    );

    if (result.data['status']) {
      return result.data['message'];
    }
    throw ServerException(
      ErrorMessageModel.fromJson(
        result.data['message'],
      ),
    );
  }

  @override
  Future<String> removeFavorites({required favoriteId}) async {
    String? token = CacheHelper.getString(key: 'token');

    final result = await DioHelper.deleteData(
        path: '${ApiConstance.favoritesUrl}/$favoriteId', token: token);

    if (result.data['status']) {
      return result.data['message'].toString();
    }
    throw ServerException(
      ErrorMessageModel.fromJson(
        result.data,
      ),
    );
  }

  @override
  Future<ProductModel> getProductDetails({required productId}) async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.getData(
        path: '${ApiConstance.productsUrl}/$productId', token: token);

    if (result.data['status']) {
      return ProductModel.fromJson(result.data['data']);
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<String> addProductToCart({required productId}) async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.postData(
      path: ApiConstance.cartUrl,
      data: {'product_id': productId},
      token: token,
    );
    if (result.data['status']) {
      return result.data['message'];
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<CartProductModel> getCarts() async {
    String? token = CacheHelper.getString(key: 'token');
    final result =
        await DioHelper.getData(path: ApiConstance.cartUrl, token: token);
    if (result.data['status']) {
      return CartProductModel.fromJson(result.data['data']);
    }
    throw ServerException(
      ErrorMessageModel.fromJson(result.data),
    );
  }

  @override
  Future<String> updateCart(
      {required int cartId, required int quantity}) async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.updateData(
        path: '${ApiConstance.cartUrl}/$cartId',
        data: {'quantity': quantity},
        token: token);

    if (result.data['status']) {
      return result.data['message'];
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<String> deleteProductFromCart({
    required int cartId,
  }) async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.deleteData(
        path: '${ApiConstance.cartUrl}/$cartId', token: token);

    if (result.data['status']) {
      return result.data['message'];
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<List<Product>> getCategoryDetails({required categoryId}) async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.getData(
        path: '${ApiConstance.categoriesUrl}/$categoryId', token: token);

    if (result.data['status']) {
      return List.from(
        (result.data['data']['data'] as List).map(
          (e) => ProductModel.fromJson(e),
        ),
      );
    }

    throw ServerException(
      ErrorMessageModel.fromJson(result.data),
    );
  }

  @override
  Future<String> signOut() async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.postData(
        path: ApiConstance.logoutUrl, data: {'fcm_token': token}, token: token);
    if (result.data['status']) {
      return result.data['message'];
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<String> updateProfile({required Register register}) async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.updateData(
        path: ApiConstance.updateProfileUrl,
        data: register.toJson(),
        token: token);
    if (result.data['status']) {
      return result.data['message'];
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<List<SearchModel>> searchProducts({required String query}) async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.postData(
        path: ApiConstance.searchUrl, token: token, data: {'text': query});

    if (result.data['status']) {
      return List.from(
        (result.data['data']['data'] as List).map(
          (e) => SearchModel.fromJson(e),
        ),
      );
    }
    throw ServerException(
      ErrorMessageModel.fromJson(result.data),
    );
  }
}
