import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/features/home/main_screen.dart';
import 'package:rizq/rizq_app.dart';

import 'core/di/inject.dart';

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
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       minTextAdapt: true,
//       builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           title: 'Rizq.sa',
//           locale: const Locale('ar', 'SA'),
//           supportedLocales: const [Locale('ar', 'SA')],
//           localeResolutionCallback: (locale, supportedLocales) =>
//               supportedLocales.first,
//           localeListResolutionCallback: (locales, supportedLocales) =>
//               supportedLocales.first,
//           localizationsDelegates: const [
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//           ],
//           navigatorKey: navigatorKey,
//           scaffoldMessengerKey: scaffoldMessengerKey,
//           home: MainScreen(),
//         );
//       },
//     );
//   }
// }
