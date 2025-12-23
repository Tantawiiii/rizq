import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';

void showCustomSnackBar({required String message, AlertState state = AlertState.error}){
  scaffoldMessengerKey.currentState!
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      padding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 15.r),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.symmetric(horizontal: AppTheme.defaultEdgePadding, vertical: AppTheme.defaultEdgePadding * 1.5),
      content: Row(
        children: [
          Expanded(child: Center(child: Text(message, style: AppTextStyles.cairoTextStyle(color: AppColors.white),))),
        ],
      ),
      backgroundColor: state == AlertState.success ? AppColors.successColor :state == AlertState.warning ? AppColors.warningColor : AppColors.errorBorderColor,
      duration: const Duration(seconds: 4),
      dismissDirection: DismissDirection.horizontal,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r),
    ),));
}