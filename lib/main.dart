import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rizq/rizq_app.dart';

import 'core/di/inject.dart';
import 'generated/locale_keys.g.dart';

void main() async{

  runApp(const RizqApp());

  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.ensureInitialized();

  init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const RizqApp());
}

List<String> syriaStatesKeys = [
  LocaleKeys.governorates_damascus,
  LocaleKeys.governorates_aleppo,
  LocaleKeys.governorates_as_suwayda,
  LocaleKeys.governorates_daraa,
  LocaleKeys.governorates_deir_ez_zor,
  LocaleKeys.governorates_hama,
  LocaleKeys.governorates_hasakah,
  LocaleKeys.governorates_homs,
  LocaleKeys.governorates_idlib,
  LocaleKeys.governorates_latakia,
  LocaleKeys.governorates_quneitra,
  LocaleKeys.governorates_raqqa,
  LocaleKeys.governorates_rif_dimashq,
  LocaleKeys.governorates_tartous,
];
String? selectedState;

List<String> commercialActivityKeys=[
  LocaleKeys.commercialActivity_buildings,
  LocaleKeys.commercialActivity_cars,
  LocaleKeys.commercialActivity_clothes,
  LocaleKeys.commercialActivity_electronics,
];