import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/company/widgets/commercial_file_data_card_widget.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/company/widgets/company_header_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class BranchesCompanyScreen extends StatelessWidget {
  const BranchesCompanyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            CompanyHeaderWidget(title: LocaleKeys.Settings_branches.tr()),
            12.verticalSpace,
            CommercialFileDataCardWidget(
              title: LocaleKeys.Settings_branchName.tr(),
              leftColumnFields: [
                FieldData(
                  label: LocaleKeys.Settings_workStartTime.tr(),
                  value: LocaleKeys.Settings_time.tr(),
                ),
                FieldData(
                  label: LocaleKeys.Settings_address.tr(),
                  value: LocaleKeys.Settings_address.tr(),
                ),
                FieldData(
                  label: LocaleKeys.Settings_officialWorkingDays.tr(),
                  value:
                      '${LocaleKeys.Settings_sunday.tr()} , ${LocaleKeys.Settings_monday.tr()} , ${LocaleKeys.Settings_tuesday.tr()} , ${LocaleKeys.Settings_wednesday.tr()} , ${LocaleKeys.Settings_thursday.tr()}',
                ),
              ],
              rightColumnFields: [
                FieldData(
                  label: LocaleKeys.Settings_workEndTime.tr(),
                  value: LocaleKeys.Settings_time.tr(),
                ),
                FieldData(
                  label: LocaleKeys.Settings_holidayDays.tr(),
                  value:
                      '${LocaleKeys.Settings_friday.tr()} , ${LocaleKeys.Settings_saturday.tr()}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
