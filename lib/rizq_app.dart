import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/features/home/main_screen.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/normal/normal_profile_tab.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/seller/shop_info_screen.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/seller/update_shop_info_screen.dart';
import 'package:rizq/features/plans/ui/bouquet_subscription_screen.dart';
import 'package:rizq/features/plans/ui/wallet_recharge_screen.dart';
import 'package:rizq/features/splash/splash_screen.dart';
import 'core/theme/theme.dart';
import 'core/utils/lang_helper.dart';
import 'features/home/tabs/create_ad_tab/ui/screens/categories_screen.dart';

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
              theme: AppTheme.lightTheme,
              title: 'رزق | Rizq',
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              navigatorKey: navigatorKey,
              scaffoldMessengerKey: scaffoldMessengerKey,

              home: MainScreen(),

            ),
          );
        },
     ),
    );
  }
}
