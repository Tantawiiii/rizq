import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/home/tabs/home_tap/screens/map_filter_screen.dart';
import '../constant/app_assets.dart';
import '../constant/app_colors.dart';
import '../constant/app_texts.dart';
import '../router/route_manager.dart';
import '../theme/app_text_styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    this.onChanged,
    this.controller,
    this.hintText,
    this.showSuffixIcon = true,
    this.readOnly = false,
  });

  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final String? hintText;
  final bool showSuffixIcon;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35.r),
        border: Border.all(color: AppColors.textFieldBorderColor),
        color: AppColors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          readOnly: readOnly,
          textAlignVertical: TextAlignVertical.center,
          style: AppTextStyles.cairoTextStyle(
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
            suffixIcon: showSuffixIcon
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Bounce(
                        onTap: ()=>  RouteManager.navigateTo(const MapFilterScreen()),
                        child: SvgPicture.asset(AppAssets.locationPinSvg, color: AppColors.sconderyColor,)),
                  )
                : null,
            hintText: hintText ?? AppTexts.search,
            hintStyle: AppTextStyles.cairoTextStyle(
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
