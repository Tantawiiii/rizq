import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/company/widgets/company_header_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class EditBranchesDataScreen extends StatefulWidget {
  const EditBranchesDataScreen({super.key});

  @override
  State<EditBranchesDataScreen> createState() => _EditBranchesDataScreenState();
}

class _EditBranchesDataScreenState extends State<EditBranchesDataScreen> {
  final TextEditingController _branchNameController = TextEditingController();
  final TextEditingController _startWorkTimeController = TextEditingController();
  final TextEditingController _endWorkTimeController = TextEditingController();

  final Map<String, bool> _workingDays = {
    LocaleKeys.Settings_saturday.tr(): false,
    LocaleKeys.Settings_sunday.tr(): false,
    LocaleKeys.Settings_monday.tr(): false,
    LocaleKeys.Settings_tuesday.tr(): false,
    LocaleKeys.Settings_wednesday.tr(): false,
    LocaleKeys.Settings_thursday.tr(): false,
    LocaleKeys.Settings_friday.tr(): false,
  };

  final Map<String, bool> _holidayDays = {
    LocaleKeys.Settings_saturday.tr(): false,
    LocaleKeys.Settings_sunday.tr(): false,
    LocaleKeys.Settings_monday.tr(): false,
    LocaleKeys.Settings_tuesday.tr(): false,
    LocaleKeys.Settings_wednesday.tr(): false,
    LocaleKeys.Settings_thursday.tr(): false,
    LocaleKeys.Settings_friday.tr(): false,
  };

  @override
  void dispose() {
    _branchNameController.dispose();
    _startWorkTimeController.dispose();
    _endWorkTimeController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context, TextEditingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: AppColors.white,
              surface: AppColors.white,
              onSurface: AppColors.blackTextColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      final formattedTime = '${picked.hour.toString().padLeft(2, '0')}:${picked.minute.toString().padLeft(2, '0')}';
      controller.text = formattedTime;
    }
  }

  void _saveData() {
    // TODO: Save data logic
    RouteManager.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            CompanyHeaderWidget(
              title: 'تعديل بيانات الفروع',
              actionText: LocaleKeys.Settings_save.tr(),
              onModifyPressed: _saveData,
            ),
            12.verticalSpace,
            // Branch Name
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.Settings_branchName.tr(),
                  style: AppTextStyles.cairoTextStyle(
                    color: AppColors.primaryColor,
                    size: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                8.verticalSpace,
                TextFormField(
                  controller: _branchNameController,
                  style: AppTextStyles.cairoTextStyle(
                    color: AppColors.greyTextColor,
                    size: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: LocaleKeys.Settings_name.tr(),
                    hintStyle: AppTextStyles.cairoTextStyle(
                      size: 13,
                      color: AppColors.fieldHintColor,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: AppColors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(start: 12.w, end: 8.w),
                      child: SvgPicture.asset(
                        AppAssets.shopIconSvg,
                        width: 22.w,
                        height: 22.w,
                        colorFilter: ColorFilter.mode(
                          AppColors.fieldHintColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor.withOpacity(0.4),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor.withOpacity(0.4),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            // Start Work Time
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.Settings_workStartTime.tr(),
                  style: AppTextStyles.cairoTextStyle(
                    color: AppColors.primaryColor,
                    size: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                8.verticalSpace,
                TextFormField(
                  controller: _startWorkTimeController,
                  readOnly: true,
                  onTap: () => _selectTime(context, _startWorkTimeController),
                  style: AppTextStyles.cairoTextStyle(
                    color: AppColors.greyTextColor,
                    size: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: LocaleKeys.Settings_time.tr(),
                    hintStyle: AppTextStyles.cairoTextStyle(
                      size: 13,
                      color: AppColors.fieldHintColor,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: AppColors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(end: 12.w),
                      child: Icon(
                        Icons.access_time,
                        color: AppColors.fieldHintColor,
                        size: 22.w,
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(minWidth: 50.w, minHeight: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor.withOpacity(0.4),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor.withOpacity(0.4),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            12.verticalSpace,
            // End Work Time
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.Settings_workEndTime.tr(),
                  style: AppTextStyles.cairoTextStyle(
                    color: AppColors.primaryColor,
                    size: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                8.verticalSpace,
                TextFormField(
                  controller: _endWorkTimeController,
                  readOnly: true,
                  onTap: () => _selectTime(context, _endWorkTimeController),
                  style: AppTextStyles.cairoTextStyle(
                    color: AppColors.greyTextColor,
                    size: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: LocaleKeys.Settings_time.tr(),
                    hintStyle: AppTextStyles.cairoTextStyle(
                      size: 13,
                      color: AppColors.fieldHintColor,
                      fontWeight: FontWeight.w400,
                    ),
                    filled: true,
                    fillColor: AppColors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    suffixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(end: 12.w),
                      child: Icon(
                        Icons.access_time,
                        color: AppColors.fieldHintColor,
                        size: 22.w,
                      ),
                    ),
                    suffixIconConstraints: BoxConstraints(minWidth: 50.w, minHeight: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor.withOpacity(0.4),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor.withOpacity(0.4),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
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
                Wrap(
                  spacing: 2.w,
                  runSpacing: 8.h,
                  children: _workingDays.entries.map((entry) => _buildCheckboxItemHorizontal(
                        entry.key,
                        entry.value,
                        (value) {
                          setState(() {
                            _workingDays[entry.key] = value ?? false;
                          });
                        },
                      )).toList(),
                ),
              ],
            ),
            12.verticalSpace,

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
                Wrap(
                  spacing: 2.w,
                  runSpacing: 8.h,
                  children: _holidayDays.entries.map((entry) => _buildCheckboxItemHorizontal(
                        entry.key,
                        entry.value,
                        (value) {
                          setState(() {
                            _holidayDays[entry.key] = value ?? false;
                          });
                        },
                      )).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxItemHorizontal(String label, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        Text(
          label,
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.blackTextColor,
            size: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
