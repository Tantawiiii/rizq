import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/company/widgets/commercial_file_data_card_widget.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/company/widgets/company_header_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class BranchesCompanyScreen extends StatefulWidget {
  const BranchesCompanyScreen({super.key});

  @override
  State<BranchesCompanyScreen> createState() => _BranchesCompanyScreenState();
}

class _BranchesCompanyScreenState extends State<BranchesCompanyScreen> {
  bool _isEditingBranchesData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            CompanyHeaderWidget(
              title: LocaleKeys.Settings_branches.tr(),
              actionText: _isEditingBranchesData
                  ? 'حفظ'
                  : LocaleKeys.Settings_modify.tr(),
              onModifyPressed: () {
                setState(() {
                  _isEditingBranchesData = !_isEditingBranchesData;
                });
              },
            ),
            12.verticalSpace,
            CommercialFileDataCardWidget(readOnly: !_isEditingBranchesData),
          ],
        ),
      ),
    );
  }
}
