import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/shared_widgets/svg_image.dart';

class ProfileMenuCard extends StatelessWidget {
  const ProfileMenuCard({
    super.key,
    required this.title,
    required this.leadingSvgPath,
    required this.trailing,
    required this.onTap,
    this.isForLogout = false,
  });

  final String title;
  final String leadingSvgPath;
  final Widget trailing;
  final bool isForLogout;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: isForLogout ? Color(0xffFEE4E2) : AppColors.overlayColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            SvgImage(
              svgPath: leadingSvgPath,
              width: 24.r,
              height: 24.r,
              color: isForLogout
                  ? AppColors.errorBorderColor
                  : AppColors.primaryColor,
            ),
            10.hGap,
            Text(
              title,
              style: AppTextStyles.cairoTextStyle(
                color: isForLogout
                    ? AppColors.errorBorderColor
                    : AppColors.primaryColor,
                size: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            trailing,
          ],
        ),
      ),
    );
  }
}
