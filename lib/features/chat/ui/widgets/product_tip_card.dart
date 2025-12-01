import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/features/chat/models/chat.dart';
import 'package:rizq/generated/locale_keys.g.dart';


class ProductTipsCard extends StatelessWidget {
  const ProductTipsCard({super.key,});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(12.r),
        color: Color(0xffACB9CD),
        strokeWidth: 1.r,
        dashPattern: [8,8],
        strokeCap: StrokeCap.round,
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          spacing: 12.r,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
            LocaleKeys.warning1.tr(context: context),
            style: AppTextStyles.cairoTextStyle(
              size: 12,
              color: AppColors.titleColor,
            ),
            ),
            Text(
              LocaleKeys.warning2.tr(context: context),
              style: AppTextStyles.cairoTextStyle(
                size: 12,
                color: AppColors.titleColor,
              ),
            ),Text(
              LocaleKeys.warning3.tr(context: context),
              style: AppTextStyles.cairoTextStyle(
                size: 12,
                color: AppColors.titleColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

