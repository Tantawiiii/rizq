import 'package:easy_localization/easy_localization.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/generated/locale_keys.g.dart';

final class FormValidators {
  static String? emailValidator(String?s){
    if(s == null || s.isEmpty ){
      return LocaleKeys.formErrors_emailRequired.tr();
    }
    if(!s.isValidEmail){
      return LocaleKeys.formErrors_emailInvalidFormat.tr();
    }
    return null;
  }

  static String? nameValidator(String?s){
    if(s == null || s.isEmpty ){
      return LocaleKeys.formErrors_nameRequired.tr();
    }
    if(s.length < 3){
      return LocaleKeys.formErrors_nameTooShort.tr();
    }
    return null;
  }

  static String? phoneValidator(String?s){
    if(s == null || s.isEmpty ){
      return LocaleKeys.formErrors_phoneRequired.tr();
    }
    return null;
  }

  static String? passwordValidator(String?s){
    if(s == null || s.isEmpty ){
      return LocaleKeys.formErrors_passwordRequired.tr();
    }
    if(!(s.isMixNumbersChars)){
      return LocaleKeys.formErrors_mixNumbersCharsPassword.tr();
    }
    return null;
  }


  static String? stateValidator(String?s){
    if(s == null || s.isEmpty ){
      return LocaleKeys.formErrors_stateRequired.tr();
    }

    return null;
  }


  static String? shopNameValidator(String?s){
    if(s == null || s.isEmpty ){
      return LocaleKeys.formErrors_shopNameRequired.tr();
    }
    return null;
  }

  static String? commercialActivityValidator(String?s){
    if(s == null || s.isEmpty ){
      return LocaleKeys.formErrors_commercialActivityRequired.tr();
    }
    return null;
  }

  static String? commercialActivityAddressValidator(String?s){
    if(s == null || s.isEmpty ){
      return LocaleKeys.formErrors_commercialActivityAddressRequired.tr();
    }
    return null;
  }

  static String? addressLinkValidator(String?s){
    if(s == null || s.isEmpty ){
      return null;
    }
    if(s.extractCoordinates == null){ // if can't extract coordinates
      return LocaleKeys.formErrors_addressLinkWrong.tr();
    }
    return null;
  }

  static String? contactWayValidator(String?s){
    if(s == null || s.isEmpty ){
      return LocaleKeys.formErrors_contactWayRequired.tr();
    }
    return null;
  }

  static String? priceTypeValidator(String?s){
    if(s == null || s.isEmpty ){
      return LocaleKeys.formErrors_priceTypeRequired.tr();
    }
    return null;
  }
}