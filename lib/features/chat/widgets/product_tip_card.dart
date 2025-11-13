


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/app_colors.dart';
import '../models/chat.dart';

class ProductTipsCard extends StatelessWidget {
  const ProductTipsCard({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: AppColors.borderGrayColor.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: AppColors.accentColor,
                child: Text(
                  chat.initials,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.contactName,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      chat.productTitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.fieldTitleColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _TipText('قم بمقابلة البائع في مكان مفتوح يوجَد به الكثير من الناس'),
          _TipText('لا تقم بتحويل ثمن المنتج للبائع قبل الفحص والتأكد من سلامته'),
          _TipText('قم بفحص المنتج جيدًا قبل استلامه'),
        ],
      ),
    );
  }
}

class _TipText extends StatelessWidget {
  const _TipText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppColors.fieldTitleColor,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}

