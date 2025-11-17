import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_colors.dart';
import 'app_text_styles.dart';

final class AppTheme{
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xffFEFEFE),
    fontFamily: 'Cairo',
    useMaterial3: true,
    brightness: Brightness.light,
    dividerTheme: DividerThemeData(
      color: Color(0xffC1C5C1),
      thickness: 1,
      indent: 10.sp,
      endIndent: 10.sp,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.white,
      titleTextStyle: AppTextStyles.cairoTextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor,
        size: 18,
      ),
      centerTitle: false,
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
      strokeWidth: 3,
      circularTrackColor: Colors.transparent,
      strokeCap: StrokeCap.round,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),

  );

  static final defaultEdgePadding = 16.r;
}