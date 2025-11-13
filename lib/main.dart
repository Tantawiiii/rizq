import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/features/home/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rizq.sa',
          locale: const Locale('ar', 'SA'),
          supportedLocales: const [Locale('ar', 'SA')],
          localeResolutionCallback: (locale, supportedLocales) =>
              supportedLocales.first,
          localeListResolutionCallback: (locales, supportedLocales) =>
              supportedLocales.first,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          navigatorKey: navigatorKey,
          scaffoldMessengerKey: scaffoldMessengerKey,
          home: MainScreen(),
        );
      },
    );
  }
}
