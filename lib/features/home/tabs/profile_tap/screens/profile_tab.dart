import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_texts.dart';
import 'package:rizq/features/auth/login/ui/screens/login_screen.dart';
import 'package:rizq/features/home/tabs/profile_tap/widgets/profile_menu_card.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/router/route_manager.dart';
import '../../../../notifications/ui/screens/notifications_screen.dart';
import 'personal_info_screen.dart';
import 'wallet_screen.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            Text(
              AppTexts.profile,
              textAlign: TextAlign.center,
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.primaryColor,
                size: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            44.verticalSpace,
            ProfileMenuCard(
              title: AppTexts.infoProfileUser,
              leadingIcon: Icons.person_outline,
              onTap: () => RouteManager.navigateTo(const PersonalInfoScreen()),
            ),
            12.verticalSpace,
            ProfileMenuCard(
              title: AppTexts.wallet,
              leadingIcon: Icons.account_balance_wallet_outlined,
              onTap: () => RouteManager.navigateTo(const WalletScreen()),
            ),
            12.verticalSpace,
            ProfileMenuCard(
              title: AppTexts.subscribtions,
              leadingIcon: Icons.location_on_outlined,
              onTap: () {},
            ),
            12.verticalSpace,
            ProfileMenuCard(
              title: AppTexts.savedAlerts,
              leadingIcon: Icons.bookmark_border,
              onTap: () {},
            ),
            12.verticalSpace,
            ProfileMenuCard(
              title: AppTexts.appLanguage,
              leadingIcon: Icons.public,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'العربية',
                    style: AppTextStyles.cairoTextStyle(
                      color: AppColors.fieldTitleColor,
                      size: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.horizontalSpace,
                  Icon(
                    Icons.expand_more,
                    size: 18.w,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
              onTap: () {},
            ),
            12.verticalSpace,
            _buildNotificationRow(),
            20.verticalSpace,
            _buildLogoutCard(context),
          ],
        ),
      ),
    );
  }


  Widget _buildNotificationRow() {
    return GestureDetector(
      onTap: () => RouteManager.navigateTo(const NotificationsScreen()),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.overlayColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Row(
          children: [
            Icon(
              Icons.notifications_none,
              color: AppColors.primaryColor,
              size: 20.w,
            ),
            12.horizontalSpace,
            Expanded(
              child: Text(
                AppTexts.notifications,
                style: AppTextStyles.cairoTextStyle(
                  color: AppColors.primaryColor,
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.w,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RouteManager.navigateAndPopAll(LoginScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFE6E6),
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.logout, color: Colors.red, size: 20.w),
            8.horizontalSpace,
            Text(
              AppTexts.logout,
              style: AppTextStyles.cairoTextStyle(
                color: Colors.red,
                size: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
