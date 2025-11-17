import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.title,
    required this.assetPath,
    required this.onTap,
  });

  final String title;
  final String assetPath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap,
      duration: const Duration(milliseconds: 120),
      child: Column(
        children: [
          Container(
            width: 76.w,
            height: 76.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.textFieldBorderColor),
              color: AppColors.white,
            ),
            padding: EdgeInsets.all(6.w),
            child: ClipOval(child: Image.asset(assetPath, fit: BoxFit.cover)),
          ),
          8.verticalSpace,
          Text(
            title,
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.blackTextColor,
              size: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
