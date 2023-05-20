import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static Future init() async {
    dio = Dio();
  }

  static Future<Response> getData(
      {required path, token, Map<String, dynamic>? query}) async {
    dio.options = BaseOptions(
      headers: {
        'lang': 'en',
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
  }

  static Future<Response> postData(
      {required path,
      token,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data}) async {
    dio.options = BaseOptions(
      headers: {
        'lang': 'en',
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
  }
}
