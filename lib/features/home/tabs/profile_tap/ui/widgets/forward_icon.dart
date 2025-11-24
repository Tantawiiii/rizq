import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';

class ForwardIcon extends StatelessWidget {
  const ForwardIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.arrow_forward_ios,
      size: 16.w,
      color: AppColors.primaryColor,
    );
  }
}
