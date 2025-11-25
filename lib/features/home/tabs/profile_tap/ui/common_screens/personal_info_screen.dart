import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/core/shared_widgets/underline_text.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarBackButton(),
        actionsPadding: EdgeInsets.symmetric(horizontal: 12.r),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Text(
              LocaleKeys.Settings_modify.tr(),
              style: AppTextStyles.cairoTextStyle(
                color: Colors.white,
                size: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
        title: Text(
          LocaleKeys.Settings_profileInfo.tr(context: context),
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.primaryColor,
            size: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: AppColors.whiteBackground,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppTheme.defaultEdgePadding),
          child: Column(
            spacing: 15.r,
            children: [
              15.vGap,
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
                          style: AppTextStyles.cairoTextStyle(
                            color: AppColors.primaryColor,
                            size: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'example@gmail.com',
                          style: AppTextStyles.cairoTextStyle(
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
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.primaryColor,
                        size: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              5.vGap,
              _ProfileCard(),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: UnderlineText(
                    text: Text(
                        LocaleKeys.Settings_changePassword.tr(),
                      style: AppTextStyles.cairoTextStyle(
                        size: 16,
                        color: AppColors.errorBorderColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}


class _ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.overlayColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _KVRow(k: 'الاسم كامل', v: 'أحمد علي'),
          SizedBox(height: 8),
          _KVRow(k: 'رقم الهاتف', v: '055000000'),
          SizedBox(height: 8),
          _KVRow(k: 'نوع النشاط', v: 'بائع'),
          SizedBox(height: 8),
          _KVRow(k: 'المحافظة', v: 'الرياض'),
          SizedBox(height: 8),
          _KVRow(k: 'العنوان', v: 'الملز - الرياض'),
        ],
      ),
    );
  }
}

class _KVRow extends StatelessWidget {
  const _KVRow({required this.k, required this.v});

  final String k;
  final String v;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          k,
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.fieldTitleColor,
            size: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          v,
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.primaryColor,
            size: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}




