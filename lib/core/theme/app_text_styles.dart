import '../constant/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

final class AppTextStyles {
  
  AppTextStyles._();
  
  static TextStyle cairoTextStyle({
    Color color = AppColors.blackTextColor,
    double size = 16,
    FontWeight fontWeight = FontWeight.normal,
  }) => TextStyle(
    color: color,
    fontSize: size.sp,
    fontWeight: fontWeight,
    fontFamily: 'Poppins',
    fontFamilyFallback: ['Cairo'],
  );
}
