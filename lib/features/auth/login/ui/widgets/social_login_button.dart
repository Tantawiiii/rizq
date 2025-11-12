import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';

class SocialLoginButton extends StatelessWidget {

  final String text;
  final Widget icon;
  final VoidCallback onPressed;
  const SocialLoginButton({super.key, required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.r),
        decoration: BoxDecoration(
          color: AppColors.socialLoginButtonColor,
          borderRadius: BorderRadius.circular(24.r),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            12.hGap,
            Text(
              text,
              style: AppTextStyles.poppinsTextStyle(
                color: AppColors.titleColor,
                size: 16,
                fontWeight: FontWeight.w500,
              )
            ),
          ],
        ),
      ),
    );
  }
}
