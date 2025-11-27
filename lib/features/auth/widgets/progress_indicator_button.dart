import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
class ProgressIndicatorButton extends StatelessWidget {
  final double value;
  const ProgressIndicatorButton({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: LinearProgressIndicator(
            minHeight: 45.r,
            backgroundColor: AppColors.primaryColor,
            value: value,
            color: AppColors.successColor,
          ),
        ),

        Center(
          child: Text(
            '${(value * 100).toInt()}%',
            style: AppTextStyles.cairoTextStyle(
              size: 15,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
