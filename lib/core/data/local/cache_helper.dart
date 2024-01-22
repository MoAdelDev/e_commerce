import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late final SharedPreferences sharedPreferences;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (!sharedPreferences.containsKey('token')) {
      saveString(key: 'token', value: '');
    } else if (!sharedPreferences.containsKey('language')) {
      saveString(key: 'language', value: Language.english.name);
    } else if (!sharedPreferences.containsKey('isDark')) {
      saveBool(key: 'isDark', value: false);
    }
  }

  static Future<bool> saveString({
    required String key,
    required String value,
  }) async {
    return await sharedPreferences.setString(key, value);
  }

  static String? getString({
    required String key,
  }) {
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
