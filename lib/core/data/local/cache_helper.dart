import 'package:shared_preferences/shared_preferences.dart';

import '../../../modules/authentication/domain/entities/user.dart';

late User user;

class CacheHelper {
  static late final SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (!sharedPreferences.containsKey('token')) {
      saveData(key: 'token', value: '');
    }
  }

  static Future<bool> saveData({
    required String key,
    required String value,
  }) async {
    return await sharedPreferences.setString(key, value);
  }

  static Future<String?> getData({
    required String key,
  }) async {
    return sharedPreferences.getString(key);
  }
}
