import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/data/remote/dio_helper.dart';
import 'package:e_commerce_app/core/error/error_message_model.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';
import 'package:e_commerce_app/core/network/api_constance.dart';
import 'package:e_commerce_app/modules/addresses/data/models/address_model.dart';

abstract class BaseAddressesRemoteDataSource {
  Future<List<AddressModel>> getAddresses();

  Future<String> addAddresses({required AddressModel addressModel});

  Future<String> deleteAddress({required int addressId});

  Future<String> updateAddress({required AddressModel addressModel});
}

class AddressesRemoteDataSource extends BaseAddressesRemoteDataSource {
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
  Future<String> addAddresses({required AddressModel addressModel}) async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.postData(
      path: ApiConstance.addressesUrl,
      data: addressModel.toJson(),
      token: token,
    );

    if (result.data['status']) {
      return result.data['message'];
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<String> deleteAddress({required int addressId}) async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.deleteData(
      path: '${ApiConstance.addressesUrl}/$addressId',
      token: token,
    );

    if (result.data['status']) {
      return result.data['message'];
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }

  @override
  Future<String> updateAddress({required AddressModel addressModel}) async {
    String? token = CacheHelper.getString(key: 'token');
    final result = await DioHelper.updateData(
      path: '${ApiConstance.addressesUrl}/${addressModel.id}',
      data: addressModel.toJson(),
      token: token,
    );

    if (result.data['status']) {
      return result.data['message'];
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }
}
