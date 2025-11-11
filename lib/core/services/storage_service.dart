
import 'package:shared_preferences/shared_preferences.dart';


class StorageService {
  static const String _keyToken = 'auth_token';
  static const String _keyLanguageCode = 'language_code';

  final SharedPreferences _prefs;

  StorageService(this._prefs);

  Future<void> saveToken(String token) async {
    await _prefs.setString(_keyToken, token);
  }

  String? getToken() {
    return _prefs.getString(_keyToken);
  }

  Future<void> removeToken() async {
    await _prefs.remove(_keyToken);
  }


  Future<void> saveLanguageCode(String code) async {
    await _prefs.setString(_keyLanguageCode, code);
  }

  String? getLanguageCode() {
    return _prefs.getString(_keyLanguageCode);
  }

}
