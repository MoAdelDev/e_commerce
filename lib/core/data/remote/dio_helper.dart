import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/data/local/data.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/core/utils/toasts.dart';
import 'package:e_commerce_app/main.dart';
import '../../error/error_message_model.dart';
import '../../error/server_exception.dart';

class DioHelper {
  static late Dio dio;

  static Future init() async {
    dio = Dio();
  }

  static Future<Response> getData(
      {required path, token, Map<String, dynamic>? query}) async {
    try {
      dio.options = BaseOptions(
        headers: {
          'lang': AppData.language == Language.arabic.name ? 'ar' : 'en',
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        queryParameters: query,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
        sendTimeout: const Duration(minutes: 2),
      );
      return await dio.get(path);
    } catch (e) {
      showToast(
          msg: 'No internet connection, try again',
          requestState: RequestState.error);

      throw ServerException(
        ErrorMessageModel.fromJson(
          const {
            'message': 'No internet connection, try again',
            'status': false
          },
        ),
      );
    }
  }

  static Future<Response> postData(
      {required path,
      token,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data}) async {
    try {
      dio.options = BaseOptions(
        headers: {
          'lang': AppData.language == Language.arabic.name ? 'ar' : 'en',
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        queryParameters: query,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
        sendTimeout: const Duration(minutes: 2),
      );
      return await dio.post(path, data: data);
    } catch (e) {
      showToast(
          msg: e.toString(),
          requestState: RequestState.error);

      throw ServerException(
        ErrorMessageModel.fromJson(
          const {
            'message': 'No internet connection, try again',
            'status': false
          },
        ),
      );
    }
  }

  static Future<Response> deleteData({
    required path,
    token,
    Map<String, dynamic>? query,
  }) async {
    try {
      dio.options = BaseOptions(
        headers: {
          'lang': AppData.language == Language.arabic.name ? 'ar' : 'en',
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        queryParameters: query,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
        sendTimeout: const Duration(minutes: 2),
      );
      return await dio.delete(path);
    } catch (e) {
      showToast(
          msg: 'No internet connection, try again',
          requestState: RequestState.error);

      throw ServerException(
        ErrorMessageModel.fromJson(
          const {
            'message': 'No internet connection, try again',
            'status': false
          },
        ),
      );
    }
  }

  static Future<Response> updateData(
      {required path,
      token,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data}) async {
    try {
      dio.options = BaseOptions(
        headers: {
          'lang': AppData.language == Language.arabic.name? 'ar' : 'en',
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        queryParameters: query,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(minutes: 2),
        receiveTimeout: const Duration(minutes: 2),
        sendTimeout: const Duration(minutes: 2),
      );
      return await dio.put(path, data: data);
    } catch (e) {
      showToast(
          msg: 'No internet connection, try again',
          requestState: RequestState.error);

      throw ServerException(
        ErrorMessageModel.fromJson(
          const {
            'message': 'No internet connection, try again',
            'status': false
          },
        ),
      );
    }
  }
}
