final class ApiConstants {
  ApiConstants._();

  // Base URL
  static const String baseUrl = 'https://api.rizq.sy/api/';

  // API Endpoints
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

  static const governoratesEndpoint = 'governorates';
  static const categoriesEndpoint = 'categories';

}

