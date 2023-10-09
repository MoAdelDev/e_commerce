import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/data/remote/dio_helper.dart';
import 'package:e_commerce_app/core/error/error_message_model.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';
import 'package:e_commerce_app/core/network/api_constance.dart';
import 'package:e_commerce_app/modules/addresses/data/models/address_model.dart';
import 'package:e_commerce_app/modules/orders/data/models/order_details_model.dart';
import 'package:e_commerce_app/modules/orders/data/models/order_model.dart';

abstract class BaseOrdersRemoteDataSource {
  Future<String> validatePromoCode({required String code});

  Future<List<AddressModel>> getAddresses();

  Future<String> addOrder({required int addressId});

  Future<List<OrderModel>> getOrders();

  Future<OrderDetailsModel> getOrderDetails({required int orderId});

  Future<String> cancelOrder({required int orderId});

}

class OrdersRemoteDataSource extends BaseOrdersRemoteDataSource {
  @override
  Future<String> validatePromoCode({required String code}) async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.postData(
        path: '${ApiConstance.promoCodesUrl}/validate',
        data: {
          'code': code,
        },
        token: token);
    if (result.data['status']) {
      return result.data['message'];
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<List<AddressModel>> getAddresses() async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.getData(
      path: ApiConstance.addressesUrl,
      token: token,
    );

    if (result.data['status']) {
      return List.from(
        (result.data['data']['data'] as List).map(
          (e) => AddressModel.fromJson(e),
        ),
      );
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<String> addOrder({required int addressId}) async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.postData(
      path: ApiConstance.ordersUrl,
      token: token,
      data: {
        'address_id': addressId,
        'payment_method': 1,
        'use_points': false,
      },
    );

    if (result.data['status']) {
      return result.data['message'];
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<List<OrderModel>> getOrders() async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.getData(
      path: ApiConstance.ordersUrl,
      token: token,
    );

    if (result.data['status']) {
      return List.from(
        (result.data['data']['data'] as List).map(
          (e) => OrderModel.fromJson(e),
        ),
      );
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<OrderDetailsModel> getOrderDetails({required int orderId}) async{
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.getData(
      path: '${ApiConstance.ordersUrl}/$orderId',
      token: token,
    );

    if (result.data['status']) {
      return OrderDetailsModel.fromJson(result.data['data']);
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<String> cancelOrder({required int orderId}) async{
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.getData(
      path: '${ApiConstance.ordersUrl}/$orderId/cancel',
      token: token,
    );
    if (result.data['status']) {
      return result.data['message'];
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }
}
