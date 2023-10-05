import 'package:e_commerce_app/core/data/local/cache_helper.dart';
import 'package:e_commerce_app/core/error/error_message_model.dart';
import 'package:e_commerce_app/core/error/server_exception.dart';

abstract class BaseHomeLocalDataSource {
  Future<void> changeLanguage({required String language});

  Future<void> changeNightMode({required bool isDark});
}

class HomeLocalDataSource extends BaseHomeLocalDataSource {
  @override
  Future<void> changeLanguage({required String language}) async {
    try {
      await CacheHelper.saveString(key: 'language', value: language);
    } catch (e) {
      throw ServerException(ErrorMessageModel(e.toString(), false));
    }
  }

  @override
  Future<void> changeNightMode({required bool isDark}) async {
    try {
      await CacheHelper.saveBool(key: 'isDark', value: isDark);
    } catch (e) {
      throw ServerException(ErrorMessageModel(e.toString(), false));
    }
  }
}
