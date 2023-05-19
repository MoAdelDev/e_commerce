import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';
import 'package:e_commerce_app/core/network/api_constance.dart';
import 'package:e_commerce_app/core/network/error_message_model.dart';

import '../../domain/entities/login.dart';
import '../../domain/entities/register.dart';
import '../models/user_model.dart';

abstract class AuthBaseRemoteDataSource {
  Future<UserModel> loginUser(Login login);

  Future<UserModel> registerUser(Register register);
}

class AuthRemoteDataSource extends AuthBaseRemoteDataSource {
  late Dio dio;

  AuthRemoteDataSource() {
    BaseOptions baseOptions = BaseOptions(
        headers: {'Content-Type': 'application/json', 'lang': 'en'});
    dio = Dio(baseOptions);
  }

  @override
  Future<UserModel> loginUser(Login login) async {
    final result = await dio.post(ApiConstance.loginUrl, data: login.toMap());
    if (result.data['status']) {
      return UserModel.fromJson(result.data['data']);
    } else {
      throw ServerException(ErrorMessageModel.fromJson(result.data));
    }
  }

  @override
  Future<UserModel> registerUser(Register register) async {
    final result = await dio.post(
      ApiConstance.registerUrl,
      data: register.toJson(),
    );
    if (result.data['status']) {
      return UserModel.fromJson(result.data['data']);
    }
    throw ServerException(ErrorMessageModel.fromJson(result.data));
  }
}
