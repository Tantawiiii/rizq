import 'package:rizq/core/utils/cache_helper.dart';

enum UserRole{
  personal,
  seller,
  company;

  void cacheUserRole() {
    CacheHelper.setValue(key: CacheKeys.userRole, value: name);
  }

  static UserRole getCachedUserRole() {

    String role = CacheHelper.getString(key: CacheKeys.userRole)?? personal.name;
    return UserRole.values.firstWhere((v)=>v.name == role);
  }
}

// register method
enum RegisterMethod{email, google, facebook}