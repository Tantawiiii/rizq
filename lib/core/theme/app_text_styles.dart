import '../constant/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';


final class AppTextStyles{

  static TextStyle cairoTextStyle({Color color = AppColors.blackTextColor, double size = 16, FontWeight fontWeight = FontWeight.normal})=>
      TextStyle(
        color: color,
        fontSize: size.sp,
        fontWeight: fontWeight,
        fontFamily: 'Cairo',
      );

  static TextStyle interTextStyle({Color color = AppColors.blackTextColor, double size = 16, FontWeight fontWeight = FontWeight.normal})=>
      TextStyle(
        color: color,
        fontSize: size.sp,
        fontWeight: fontWeight,
        fontFamily: 'Inter',
      );


}