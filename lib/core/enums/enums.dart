

import 'package:rizq/core/locale_storage/cache_helper.dart';
import 'package:rizq/core/locale_storage/cache_keys.dart';

enum UserRole{
  normal,
  seller,
  company;

  void cacheUserRole() {
    CacheHelper.put(key: CacheKeys.userRole, value: name);
  }

  static UserRole getCachedUserRole() {
    String role = CacheHelper.get<String>(key: CacheKeys.userRole)?? normal.name;
    return UserRole.values.firstWhere((v)=>v.name == role);
  }

  bool get isNormal => this == UserRole.normal;
}

// register method
enum RegisterMethod{email, google, facebook}
enum AlertState {success,warning, error}

enum PaymentMethod {paypal, stripe, masterCard}