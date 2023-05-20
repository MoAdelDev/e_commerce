import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/data/remote/dio_helper.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';
import 'package:e_commerce_app/core/network/api_constance.dart';
import 'package:e_commerce_app/core/network/error_message_model.dart';
import 'package:e_commerce_app/modules/authentication/data/models/user_model.dart';
import 'package:e_commerce_app/modules/home/data/models/product_model.dart';

abstract class HomeBaseDataSource {
  Future<List<ProductModel>> getProducts();

  Future<UserModel> getUser();
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
}
