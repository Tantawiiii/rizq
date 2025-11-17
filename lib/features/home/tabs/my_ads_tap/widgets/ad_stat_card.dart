import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../model/ad_stat_item.dart';

class AdStatCard extends StatelessWidget {
  const AdStatCard({required this.item});
  final AdStatItem item;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: item.onTap ?? () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.overlayColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SizedBox(
          height: 144.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(item.icon, size: 28.w, color: AppColors.primaryColor),
              12.verticalSpace,
              Text(
                item.title,
                textAlign: TextAlign.start,
                style: AppTextStyles.cairoTextStyle(
                  color: AppColors.primaryColor,
                  size: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.chevron_left,
                    size: 18.w,
                    color: AppColors.primaryColor,
                  ),
                  const Spacer(),
                  Text(
                    '${item.count}',
                    style: AppTextStyles.cairoTextStyle(
                      color: AppColors.primaryColor,
                      size: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}