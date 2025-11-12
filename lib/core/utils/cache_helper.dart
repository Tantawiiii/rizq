
import 'package:rizq/core/di/inject.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class CacheHelper{

  static void setValue({
    required String key,
    required dynamic value,
  }) async {
    final prefs =  sl<SharedPreferences>();

    if (value is bool) await prefs.setBool(key, value);

    if (value is int) await prefs.setInt(key, value);

    if (value is double) await prefs.setDouble(key, value);

    if (value is String) await prefs.setString(key, value);

    if (value is List<String>) await prefs.setStringList(key, value);
  }

  static bool? getBool({required String key}){
    final prefs =  sl<SharedPreferences>();
    return prefs.getBool(key);
  }

  static String? getString({required String key}){
    final prefs =  sl<SharedPreferences>();
    return prefs.getString(key);
  }
}

final class CacheKeys{

  static const String userRole = 'userRole';

}