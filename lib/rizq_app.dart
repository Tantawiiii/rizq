import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/features/auth/login/ui/screens/login_screen.dart';
import 'package:rizq/features/auth/register/personal/ui/personal_register_screen.dart';
import 'package:rizq/features/auth/register/seller/ui/screens/seller_persoal_info.dart';
import 'package:rizq/features/splash/splash_screen.dart';

import 'core/constant/app_colors.dart';
import 'core/utils/lang_helper.dart';

class RizqApp extends StatelessWidget {
  const RizqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: [
        LangHelper.englishLocale,
        LangHelper.arabicLocale,
      ],
      path: LangHelper.translationsPath,
      fallbackLocale: LangHelper.englishLocale,
      startLocale: LangHelper.arabicLocale,

      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              systemNavigationBarDividerColor: Colors.transparent,
              systemNavigationBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.transparent,
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Rizq',
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              navigatorKey: navigatorKey,
              scaffoldMessengerKey: scaffoldMessengerKey,
              home: RegisterSellerPersonalInfoScreen(),
            ),
          );
        },
     ),
    );
  }
}
