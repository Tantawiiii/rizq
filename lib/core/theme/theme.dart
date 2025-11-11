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
      backgroundColor: Color(0xffFEFEFE),
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Color(0xffFEFEFE),
      titleTextStyle: AppTextStyles.cairoTextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.primaryColor,
      ),
      centerTitle: true,
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