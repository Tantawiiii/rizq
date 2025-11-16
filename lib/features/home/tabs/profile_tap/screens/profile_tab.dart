import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/features/home/tabs/profile_tap/widgets/profile_menu_card.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/router/route_manager.dart';
import 'personal_info_screen.dart';

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

            ProfileMenuCard(
              title: 'معلومات الملف الشخصي',
              leadingIcon: Icons.person_outline,
              onTap: () => RouteManager.navigateTo(const PersonalInfoScreen()),
            ),
            12.verticalSpace,
            ProfileMenuCard(
              title: 'بيانات المتجر',
              leadingIcon: Icons.store_outlined,
              onTap: () {},
            ),
            12.verticalSpace,
            ProfileMenuCard(
              title: 'المحفظة',
              leadingIcon: Icons.account_balance_wallet_outlined,
              onTap: () {},
            ),
            12.verticalSpace,
            ProfileMenuCard(
              title: 'الإشتراكات',
              leadingIcon: Icons.location_on_outlined,
              onTap: () {},
            ),
            12.verticalSpace,
            ProfileMenuCard(
              title: 'لغة التطبيق',
              leadingIcon: Icons.public,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'العربية',
                    style: AppTextStyles.poppinsTextStyle(
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

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            'الملف الشخصي',
            textAlign: TextAlign.center,
            style: AppTextStyles.poppinsTextStyle(
              color: AppColors.primaryColor,
              size: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(width: 24.w),
      ],
    );
  }

  Widget _buildProfileCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.overlayColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 28.w,
                backgroundImage: const AssetImage('assets/pngs/rizq_logo.png'),
              ),
              12.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'أحمد علي',
                      style: AppTextStyles.poppinsTextStyle(
                        color: AppColors.primaryColor,
                        size: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      'example@gmail.com',
                      style: AppTextStyles.poppinsTextStyle(
                        color: AppColors.greyTextColor,
                        size: 14,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'تعديل',
                  style: AppTextStyles.poppinsTextStyle(
                    color: AppColors.primaryColor,
                    size: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          16.verticalSpace,
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.all(12.w),
            child: Column(
              children: [
                _kvRow('الاسم كامل', 'أحمد علي'),
                8.verticalSpace,
                _kvRow('رقم الهاتف', '055000000'),
                8.verticalSpace,
                _kvRow('نوع النشاط', 'بائع'),
                8.verticalSpace,
                _kvRow('المحافظة', 'الرياض'),
                8.verticalSpace,
                _kvRow('العنوان', 'الملز - الرياض'),
              ],
            ),
          ),
          12.verticalSpace,
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              'تغيير كلمة المرور',
              style: AppTextStyles.poppinsTextStyle(
                color: Colors.red,
                size: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _kvRow(String k, String v) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          k,
          style: AppTextStyles.poppinsTextStyle(
            color: AppColors.fieldTitleColor,
            size: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          v,
          style: AppTextStyles.poppinsTextStyle(
            color: AppColors.primaryColor,
            size: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationRow() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.overlayColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'الإشعارات',
              style: AppTextStyles.poppinsTextStyle(
                color: AppColors.primaryColor,
                size: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Switch(
            value: true,
            onChanged: (_) {},
            activeColor: AppColors.primaryColor,
          ),
          8.horizontalSpace,
          Icon(
            Icons.notifications_none,
            color: AppColors.primaryColor,
            size: 20.w,
          ),
        ],
      ),
    );
  }

  Widget _buildLogoutCard(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFFE6E6),
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'تسجيل الخروج',
                style: AppTextStyles.poppinsTextStyle(
                  color: Colors.red,
                  size: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Icon(Icons.logout, color: Colors.red, size: 20.w),
          ],
        ),
      ),
    );
  }
}
