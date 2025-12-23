final class Endpoints {
  Endpoints._();

  // Base URL
  static const String baseUrl = 'https://api.rizq.sy/api/';

  //auth
  static const loginEndpoint = 'login';
  static const registerEndpoint = 'register';
  static const sendResetPasswordOtpEndpoint = 'send-reset-password-otp';
  static const resetPasswordEndpoint = 'reset-password';
  static const refreshToken = 'refresh';
  static const verifyOtpEndpoint = 'verify-otp';

  // subscriptions bouquets
   static const subscriptionBouquetsEndpoint = 'packages';

   // general

  static const governoratesEndpoint = 'look-up/governorates';
  static const categoriesEndpoint = 'look-up/categories';

}

