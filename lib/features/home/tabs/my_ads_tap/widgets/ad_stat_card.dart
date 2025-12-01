import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';


class AdStatCard extends StatelessWidget {
  const AdStatCard({ required this.name, required this.svgPath, required this.number, required this.onPressed});
  final String name;
  final String svgPath;
  final int number;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.overlayColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SizedBox(
          height: 144.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgImage(svgPath:  svgPath, width: 28.r, height: 28.r, color: AppColors.primaryColor),
              12.verticalSpace,
              Text(
                name,
                textAlign: TextAlign.start,
                style: AppTextStyles.cairoTextStyle(
                  color: AppColors.titleColor,
                  size: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Row(
                children: [

                  Text(
                    number.toString(),
                    style: AppTextStyles.cairoTextStyle(
                      color: AppColors.primaryColor,
                      size: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.keyboard_arrow_left,
                    size: 18.w,
                    color: AppColors.primaryColor,
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