import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:rizq/rizq_app.dart';

void main() {
  runApp(const RizqApp());

  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(RizqApp());

}
