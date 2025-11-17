import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            _Header(),
            16.verticalSpace,
            _ProfileCard(),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20.w,
            color: AppColors.primaryColor,
          ),
        ),
        Expanded(
          child: Text(
            'معلومات الملف الشخصي',
            textAlign: TextAlign.center,
            style: AppTextStyles.poppinsTextStyle(
              color: AppColors.primaryColor,
              size: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(width: 48.w),
      ],
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
              children: const [
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
}




