import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rizq/core/constant/app_texts.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';

import '../../../core/constant/app_assets.dart';
import '../../../core/constant/app_colors.dart';

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
          ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: PrimaryButton(
                key: const ValueKey('collapsed_bottom_nav'),
                backgroundColor: AppColors.sconderyColor,
                onPressed: onAddPressed ?? () => onItemSelected?.call(1),
                title: AppTexts.chats,
              icon: Icon( Icons.chat_bubble_outline,color: AppColors.white,),
              ),
          )
          : _ExpandedBottomNav(
              key: const ValueKey('expanded_bottom_nav'),
              selectedIndex: selectedIndex,
              onItemSelected: onItemSelected,
              onAddPressed: onAddPressed,
            ),
    );
  }
}

class _ExpandedBottomNav extends StatelessWidget {
  const _ExpandedBottomNav({
    super.key,
    required this.selectedIndex,
    this.onItemSelected,
    this.onAddPressed,
  });

  final int selectedIndex;
  final ValueChanged<int>? onItemSelected;
  final VoidCallback? onAddPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.sconderyColor,
        borderRadius: BorderRadius.circular(35.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _NavIcon(
              icon: AppAssets.userSvg,
              isActive: selectedIndex == 0,
              onTap: () => onItemSelected?.call(0),
              activeColor: AppColors.sconderyColor,
              inactiveColor: AppColors.primaryColor,
            ),
            _NavIcon(
              icon: AppAssets.chatSvg,
              isActive: selectedIndex == 1,
              onTap: () => onItemSelected?.call(1),
              activeColor: AppColors.sconderyColor,
              inactiveColor: AppColors.primaryColor,
            ),
            _AddButton(
              onTap: onAddPressed ?? () => onItemSelected?.call(1),
            ),
            _NavIcon(
              icon: AppAssets.adsSvg,
              isActive: selectedIndex == 2,
              onTap: () => onItemSelected?.call(2),
              activeColor: AppColors.sconderyColor,
              inactiveColor: AppColors.primaryColor,
            ),
            _NavIcon(
              icon: AppAssets.homeSvg,
              isActive: selectedIndex == 3,
              onTap: () => onItemSelected?.call(3),
              activeColor: AppColors.sconderyColor,
              inactiveColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  const _NavIcon({
    required this.icon,
    required this.isActive,
    required this.onTap,
    required this.activeColor,
    required this.inactiveColor,
  });

  final String icon;
  final bool isActive;
  final VoidCallback onTap;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        alignment: Alignment.center,
        child: SvgPicture.asset(
          icon,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            isActive ? activeColor : inactiveColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 56.w,
        height: 56.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.white,
        ),
        child: Center(
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.sconderyColor,
            ),
            child: Icon(
              Icons.add,
              color: AppColors.white,
              size: 24.sp,
            ),
          ),
        ),
      ),
    );
  }
}
