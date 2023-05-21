import 'package:e_commerce_app/core/data/remote/dio_helper.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';
import 'package:e_commerce_app/core/network/api_constance.dart';
import 'package:e_commerce_app/core/error/error_message_model.dart';

import '../../domain/entities/login.dart';
import '../../domain/entities/register.dart';
import '../models/user_model.dart';

abstract class AuthBaseRemoteDataSource {
  Future<UserModel> loginUser(Login login);

  Future<UserModel> registerUser(Register register);
}

class AuthRemoteDataSource extends AuthBaseRemoteDataSource {
  @override
  Future<UserModel> loginUser(Login login) async {
    final result = await DioHelper.postData(
      path: ApiConstance.loginUrl,
      data: login.toJson(),
    );
    if (result.data['status']) {
      return UserModel.fromJson(result.data['data']);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(result.data));
    }
  }

  @override
  Future<UserModel> registerUser(Register register) async {
    final result = await DioHelper.postData(
      path: ApiConstance.registerUrl,
      data: register.toJson(),
    );
    if (result.data['status']) {
      return UserModel.fromJson(result.data['data']);
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }
}
