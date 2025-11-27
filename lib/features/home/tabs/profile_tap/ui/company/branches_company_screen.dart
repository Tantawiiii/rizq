import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/company/edit_branches_data_screen.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/company/widgets/company_header_widget.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/company/widgets/field_item_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class BranchesCompanyScreen extends StatelessWidget {
  const BranchesCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data - in real app, this would come from state management
    const String branchName = '';
    const String startWorkTime = '';
    const String endWorkTime = '';
    final List<String> workingDays = [
      LocaleKeys.Settings_sunday.tr(),
      LocaleKeys.Settings_monday.tr(),
      LocaleKeys.Settings_tuesday.tr(),
      LocaleKeys.Settings_wednesday.tr(),
      LocaleKeys.Settings_thursday.tr(),
    ];
    final List<String> holidayDays = [
      LocaleKeys.Settings_friday.tr(),
      LocaleKeys.Settings_saturday.tr(),
    ];

    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            CompanyHeaderWidget(
              title: LocaleKeys.Settings_branches.tr(),
              actionText: LocaleKeys.Settings_modify.tr(),
              onModifyPressed: () {
                RouteManager.navigateTo(const EditBranchesDataScreen());
              },
            ),
            12.verticalSpace,
            // Branch Name
            FieldItemWidget(
              label: LocaleKeys.Settings_branchName.tr(),
              value: branchName,
              readOnly: true,
            ),
            12.verticalSpace,
            // Start Work Time
            FieldItemWidget(
              label: LocaleKeys.Settings_workStartTime.tr(),
              value: startWorkTime,
              readOnly: true,
            ),
            12.verticalSpace,
            // End Work Time
            FieldItemWidget(
              label: LocaleKeys.Settings_workEndTime.tr(),
              value: endWorkTime,
              readOnly: true,
            ),
            12.verticalSpace,
            // Official Working Days
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.Settings_officialWorkingDays.tr(),
                  style: AppTextStyles.cairoTextStyle(
                    color: AppColors.primaryColor,
                    size: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                8.verticalSpace,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.overlayColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    workingDays.join(' , '),
                    style: AppTextStyles.cairoTextStyle(
                      color: AppColors.fieldHintColor,
                      size: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            // Holiday Days
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.Settings_holidayDays.tr(),
                  style: AppTextStyles.cairoTextStyle(
                    color: AppColors.primaryColor,
                    size: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                8.verticalSpace,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.overlayColor,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Text(
                    holidayDays.join(' , '),
                    style: AppTextStyles.cairoTextStyle(
                      color: AppColors.fieldHintColor,
                      size: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
