import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_colors.dart';
import '../theme/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
    this.height,
  });

  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = isLoading || onPressed == null;

    return Bounce(
      onTap: isDisabled ? null : onPressed,
      duration: const Duration(milliseconds: 140),
      tilt: false,
      child: SizedBox(
        width: double.infinity,
        height: height ?? 56.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: isDisabled
                ? AppColors.primaryColor.withOpacity(0.6)
                : AppColors.primaryColor,
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 20.w,
                    width: 20.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.4,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColors.white,
                      ),
                    ),
                  )
                : Text(
                    title,
                    style: AppTextStyles.cairoTextStyle(
                      size: 18,
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
