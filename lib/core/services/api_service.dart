import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> postData(
      {required body,
      required String url,
      required String token,
      Map<String, dynamic>? headers}) async {
    return await dio.post(
      url,
      data: body,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        headers: headers ??
            {
              'Authorization': 'Bearer $token',
            },
      ),
    );
  }
}
