import 'package:rizq/core/utils/cache_helper.dart';

enum UserRole{
  normal,
  seller,
  company;

  void cacheUserRole() {
    CacheHelper.setValue(key: CacheKeys.userRole, value: name);
  }

  static UserRole getCachedUserRole() {

    String role = CacheHelper.getString(key: CacheKeys.userRole)?? normal.name;
    return UserRole.values.firstWhere((v)=>v.name == role);
  }

  bool get isNormal => this == UserRole.normal;
}

// register method
enum RegisterMethod{email, google, facebook}
enum AlertState {success,warning, error}

enum PaymentMethod {paypal, stripe, masterCard}