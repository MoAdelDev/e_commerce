import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/data/remote/dio_helper.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';
import 'package:e_commerce_app/core/network/api_constance.dart';
import 'package:e_commerce_app/core/error/error_message_model.dart';
import 'package:e_commerce_app/modules/authentication/data/models/user_model.dart';
import 'package:e_commerce_app/modules/home/data/models/banner_model.dart';
import 'package:e_commerce_app/modules/home/data/models/category_model.dart';
import 'package:e_commerce_app/modules/home/data/models/product_model.dart';

import '../models/favorite_model.dart';

abstract class HomeBaseDataSource {
  Future<List<ProductModel>> getProducts();

  Future<List<BannerModel>> getBanners();

  Future<List<CategoryModel>> getCategories();

  Future<UserModel> getUser();

  Future<List<FavoriteModel>> getFavorites();

  Future<FavoriteModel> changeFavorite({required productId});
}

class HomeDataSource extends HomeBaseDataSource {
  @override
  Future<List<ProductModel>> getProducts() async {
    String? token = await CacheHelper.getData(key: 'token');

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
    String? token = await CacheHelper.getData(key: 'token');

    final result = await DioHelper.getData(
      path: ApiConstance.profileUrl,
      token: token,
    );
    if (result.data['status']) {
      return UserModel.fromJson(result.data['data']);
    }
    throw ServerException(
      ErrorMessageModel.fromJson(
        result.data['message'],
      ),
    );
  }

  @override
  Future<List<FavoriteModel>> getFavorites() async {
    String? token = await CacheHelper.getData(key: 'token');
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
  Future<FavoriteModel> changeFavorite({required productId}) async {
    String? token = await CacheHelper.getData(key: 'token');
    final result = await DioHelper.postData(
      path: ApiConstance.favoritesUrl,
      data: {'product_id': productId},
      token: token,
    );

    if (result.data['status']) {
      return FavoriteModel.fromJson(
        result.data['data'],
      );
    }
    throw ServerException(
      ErrorMessageModel.fromJson(
        result.data['message'],
      ),
    );
  }
}
