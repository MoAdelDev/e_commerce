import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/utils/enums.dart';
import 'package:e_commerce_app/modules/authentication/domain/entities/user.dart';

class AppData{
  static User? user;
  static Map<int, bool> favoriteMap = {};
  static Map<int, int> productCartQuantity = {};

  static String language =
      CacheHelper.getString(key: 'language') ?? Language.english.name;

  static bool isDark = CacheHelper.getBool(key: 'isDark') ?? false;}