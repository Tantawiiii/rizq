import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';


class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.trailing,
    this.onTap,
  });

  final String title;
  final IconData leadingIcon;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.overlayColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          child: Row(
            children: [
              Icon(
                Icons.chevron_left,
                size: 20.w,
                color: AppColors.primaryColor,
              ),
              8.horizontalSpace,
              Expanded(
                child: Row(
                  children: [
                    Icon(
                      leadingIcon,
                      size: 20.w,
                      color: AppColors.primaryColor,
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: Text(
                        title,
                        style: AppTextStyles.cairoTextStyle(
                          color: AppColors.primaryColor,
                          size: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ),
      ),
    );
  }
}

