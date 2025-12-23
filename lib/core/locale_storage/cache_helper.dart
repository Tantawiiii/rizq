import 'dart:typed_data';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rizq/core/locale_storage/secure_hive_manager.dart';

import 'cache_keys.dart';


class CacheHelper {
  static Box? _box;

  static Future<void> init() async {
    await Hive.initFlutter();

    final Uint8List key =
    await SecureHiveKeyManager.getOrCreateKey();

    _box = await Hive.openBox(
      CacheKeys.boxName,
      encryptionCipher: HiveAesCipher(key),
    );
  }

  static Future<void> put({required String key, required dynamic value}) async {
    await _box?.put(key, value);
  }

  static T? get<T>({required String key}) {
    return _box?.get(key) as T?;
  }

  static Future<void> delete(String key) async {
    await _box?.delete(key);
  }

  static Future<void> clear() async {
    await _box?.clear();
  }

  /// Call this on root/jailbreak detection
  static Future<void> wipeCompletely() async {
    await _box?.clear();
    await _box?.close();
    await SecureHiveKeyManager.deleteKey();
  }
}
