import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rizq/generated/locale_keys.g.dart';

final class LangHelper {
  static const String englishCode = 'en';
  static const String arabicCode = 'ar';

  static const Locale arabicLocale = Locale('ar');
  static const Locale englishLocale = Locale('en');

  static const translationsPath = 'assets/lang';

  static String getLanguageKeyFromCode({required BuildContext context}){
    var langCode = context.locale.languageCode;

    return switch(langCode){
      arabicCode => LocaleKeys.Languages_arabic,
     englishCode => LocaleKeys.Languages_english,
     _ => LocaleKeys.Languages_arabic,
    };
  }

  static bool isCurrentLanguageArabic({required BuildContext context}){
    return context.locale == arabicLocale;
  }



  static String apiAcceptLanguageHeader = 'ar';
  /// changes the app app language and API Accept-Language header
  static void changeAppLanguage({required BuildContext context,})async{

    var currentLocale = context.locale;

    var newLocale = currentLocale == arabicLocale ? englishLocale : arabicLocale;

    apiAcceptLanguageHeader = newLocale.languageCode;

    await context.setLocale(newLocale);

  }

}