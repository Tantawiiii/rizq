import 'dart:typed_data';
import 'dart:math';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rizq/core/locale_storage/cache_keys.dart';

class SecureHiveKeyManager {

  static const _storage = FlutterSecureStorage();

  /// Get or generate encryption key
  static Future<Uint8List> getOrCreateKey() async {
    final existingKey = await _storage.read(key: CacheKeys.boxKeyName);

    if (existingKey != null) {
      return Uint8List.fromList(existingKey.codeUnits);
    }

    final newKey = _generateKey();
    await _storage.write(
      key: CacheKeys.boxKeyName,
      value: String.fromCharCodes(newKey),
    );

    return newKey;
  }

  /// Delete key (call on logout / security breach)
  static Future<void> deleteKey() async {
    await _storage.delete(key: CacheKeys.boxKeyName);
  }

  static Uint8List _generateKey() {
    final random = Random.secure();
    return Uint8List.fromList(
      List<int>.generate(32, (_) => random.nextInt(256)),
    );
  }
}
