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
    "register": {
      "chooseYourAccountType": "Choose your account type",
      "personalAccount": "Personal account",
      "sellerAccount": "Seller account",
      "companyAccount": "Company account",
      "alreadyHaveAccount": "Already have an account?",
      "chooseRegisterWay": "Choose your registration method",
      "createYourAccountAndExplore": "Create your account now to explore our app"
    },
    "email": "Email",
    "shortEmail": "Email",
    "password": "Password",
    "phone": "Phone number",
    "state": "Governorate",
    "confirmPassword": "Confirm password",
    "userName": "Username",
    "name": "Name",
    "forgotPassword": "Forgot password?",
    "next": "Next"
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
  },
  "governorates": {
    "damascus": "Damascus",
    "rif_dimashq": "Rif Dimashq",
    "aleppo": "Aleppo",
    "homs": "Homs",
    "hama": "Hama",
    "latakia": "Latakia",
    "tartous": "Tartous",
    "idlib": "Idlib",
    "deir_ez_zor": "Deir ez-Zor",
    "hasakah": "Al-Hasakah",
    "raqqa": "Al-Raqqa",
    "daraa": "Daraa",
    "as_suwayda": "As-Suwayda",
    "quneitra": "Quneitra"
  }
};
static const Map<String,dynamic> _ar = {
  "Auth": {
    "Login": {
      "welcomeBack": "مرحبا بعودتك!",
      "loginAndExploreApp": "قم بتسجيل الدخول لاستكشاف تطبيقنا",
      "googleSignIn": "جوجل",
      "or": "أو",
      "facebookSignIn": "فيسبوك",
      "login": "تسجيل الدخول",
      "noAccount": "ليس لديك حساب؟",
      "signUp": "إنشاء حساب"
    },
    "register": {
      "chooseYourAccountType": "قم باختيار طبيعة عملك",
      "personalAccount": "حساب شخصي",
      "sellerAccount": "حساب مشتري",
      "companyAccount": "حساب شركة",
      "alreadyHaveAccount": "لديك حساب بالفعل",
      "chooseRegisterWay": "قم باختيار طريقة التسجيل",
      "createYourAccountAndExplore": "قم بإنشاء حسابك الآن لإستكشاف تطبيقنا"
    },
    "email": "البريد الإلكتروني",
    "shortEmail": "البريد",
    "password": "كلمة المرور",
    "phone": "رقم الهاتف",
    "state": "المحافظة",
    "confirmPassword": "تأكيد كلمة المرور",
    "userName": "اسم المستخدم",
    "name": "الاسم",
    "forgotPassword": "نسيت كلمة المرور؟",
    "next": "التالي"
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
  },
  "governorates": {
    "damascus": "دمشق",
    "rif_dimashq": "ريف دمشق",
    "aleppo": "حلب",
    "homs": "حمص",
    "hama": "حماة",
    "latakia": "اللاذقية",
    "tartous": "طرطوس",
    "idlib": "إدلب",
    "deir_ez_zor": "دير الزور",
    "hasakah": "الحسكة",
    "raqqa": "الرقة",
    "daraa": "درعا",
    "as_suwayda": "السويداء",
    "quneitra": "القنيطرة"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "ar": _ar};
}
