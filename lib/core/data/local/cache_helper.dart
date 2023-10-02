import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (!sharedPreferences.containsKey('token')) {
      saveData(key: 'token', value: '');
    }
    else if(!sharedPreferences.containsKey('isArabic')) {
      saveBool(key: 'isArabic', value: false);
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

  static Future<bool> saveBool({
    required String key,
    required bool value,
  }) async {
    return await sharedPreferences.setBool(key, value);
  }

  static bool? getBool({
    required String key,
  }) {
    return sharedPreferences.getBool(key);
  }
}
