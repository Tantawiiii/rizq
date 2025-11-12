import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constant/app_colors.dart';

class NavIconButton extends StatelessWidget {
  const   NavIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.isActive = false,
    this.enlargeWhenSelected = false,
  });

  final String icon;
  final VoidCallback? onTap;
  final bool isActive;
  final bool enlargeWhenSelected;

  @override
  Widget build(BuildContext context) {
    final double baseSize = 44.h;
    final double selectedSize = enlargeWhenSelected ? 62.h : 54.h;
    final double iconSize = isActive ? 14.sp : 14.sp;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: isActive ? selectedSize : baseSize,
        width: isActive ? selectedSize : baseSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? AppColors.accentColor : Colors.transparent,
          // border: isActive
          //     ? null
          //     : Border.all(color: AppColors.white, width: 2.r),
        ),
        child: Padding(
          padding: isActive ? const EdgeInsets.all(14.0): const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            icon,
            height: iconSize,
            width: iconSize,
            colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}
