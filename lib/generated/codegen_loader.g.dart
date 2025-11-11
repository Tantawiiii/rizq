// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "Auth": {
    "Login": {
      "welcomeBack": "Welcome back!",
      "loginAndExploreApp": "Log in to explore our app",
      "googleSignIn": "Google",
      "or": "Or",
      "facebookSignIn": "Facebook",
      "login": "Log In",
      "noAccount": "Don't have an account?",
      "signUp": "Sign Up"
    },
    "email": "Email",
    "password": "Password",
    "forgotPassword": "Forgot Password?"
  },
  "Home": {},
  "myAds": {},
  "createAd": {},
  "Settings": {},
  "Notifications": {},
  "Chatting": {},
  "Languages": {
    "arabic": "Arabic",
    "english": "English"
  }
};
static const Map<String,dynamic> _ar = {
  "Auth": {
    "Login": {
      "welcomeBack": "مرحبًا بعودتك!",
      "loginAndExploreApp": "قم بتسجيل الدخول لاستكشاف تطبيقنا",
      "googleSignIn": "جوجل",
      "or": "أو",
      "facebookSignIn": "فيسبوك",
      "login": "تسجيل الدخول",
      "noAccount": "ليس لديك حساب؟",
      "signUp": "إنشاء حساب"
    },
    "email": "البريد الإلكتروني",
    "password": "كلمة المرور",
    "forgotPassword": "نسيت كلمة المرور؟"
  },
  "Home": {},
  "myAds": {},
  "createAd": {},
  "Settings": {},
  "Notifications": {},
  "Chatting": {},
  "Languages": {
    "arabic": "العربية",
    "english": "الإنجليزية"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "ar": _ar};
}
