import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/app_assets.dart';
import '../constant/app_colors.dart';
import '../constant/app_texts.dart';
import '../theme/app_text_styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, this.onChanged, this.controller});

  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.r),
        border: Border.all(color: AppColors.textFieldBorderColor),
        color: AppColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          textAlignVertical: TextAlignVertical.center,
          style: AppTextStyles.poppinsTextStyle(
            color: AppColors.primaryColor,
            size: 16,
          ),
          decoration: InputDecoration(
            icon: SvgPicture.asset(
              AppAssets.searchNormalSvg,
              width: 20.w,
              height: 20.h,
              fit: BoxFit.contain,
            ),
            hintText: AppTexts.search,
            hintStyle: AppTextStyles.poppinsTextStyle(
              color: AppColors.greyTextColor,
              size: 16,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
