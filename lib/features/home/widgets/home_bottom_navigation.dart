import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';

import '../../../core/constant/app_assets.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'nav_icon.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({
    super.key,
    required this.isCollapsed,
    this.selectedIndex = 0,
    this.onItemSelected,
    this.onAddPressed,
  });

  final bool isCollapsed;
  final int selectedIndex;
  final ValueChanged<int>? onItemSelected;
  final VoidCallback? onAddPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      child: isCollapsed
          ? PrimaryButton(
              key: const ValueKey('collapsed_bottom_nav'),
              backgroundColor: AppColors.accentColor,
              onPressed: onAddPressed ?? () => onItemSelected?.call(1), title: "إضافة إعلان",

            )
          : _ExpandedBottomNav(
              key: const ValueKey('expanded_bottom_nav'),
              selectedIndex: selectedIndex,
              onItemSelected: onItemSelected,
            ),
    );
  }
}

class _ExpandedBottomNav extends StatelessWidget {
  const _ExpandedBottomNav({
    super.key,
    required this.selectedIndex,
    this.onItemSelected,
  });

  final int selectedIndex;
  final ValueChanged<int>? onItemSelected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(46.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.18),
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavIconButton(
              icon: AppAssets.userSvg,
              isActive: selectedIndex == 0,
              onTap: () => onItemSelected?.call(0),
              enlargeWhenSelected: true,
            ),
            NavIconButton(
              icon: AppAssets.addCircleSvg,
              isActive: selectedIndex == 1,
              onTap: () => onItemSelected?.call(1),
              enlargeWhenSelected: true,
            ),
            NavIconButton(
              icon: AppAssets.adsSvg,
              isActive: selectedIndex == 2,
              onTap: () => onItemSelected?.call(2),
            ),
            NavIconButton(
              icon: AppAssets.homeSvg,
              isActive: selectedIndex == 3,
              onTap: () => onItemSelected?.call(3),
              enlargeWhenSelected: true,
            ),
          ],
        ),
      ),
    );
  }
}

