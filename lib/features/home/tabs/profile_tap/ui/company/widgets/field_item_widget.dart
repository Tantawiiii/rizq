import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';

class FieldItemWidget extends StatelessWidget {
  const FieldItemWidget({
    super.key,
    required this.label,
    required this.value,
    this.controller,
    this.onTap,
    this.readOnly = true,
    this.iconSvg,
  });

  final String label;
  final String value;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool readOnly;
  final String? iconSvg;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.primaryColor,
            size: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        8.verticalSpace,
        TextFormField(
          controller: controller,
          initialValue: controller == null ? value : null,
          readOnly: readOnly,
          onTap: onTap,
          enableInteractiveSelection: false,
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.fieldHintColor,
            size: 14,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: AppColors.overlayColor,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 16.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: readOnly
                    ? Colors.transparent
                    : AppColors.primaryColor.withOpacity(0.4),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: AppColors.primaryColor.withOpacity(0.4),
              ),
            ),
            prefixIcon: iconSvg != null
                ? Padding(
                    padding: EdgeInsetsDirectional.only(start: 12.w, end: 8.w),
                    child: SvgPicture.asset(
                      iconSvg!,
                      width: 22.w,
                      height: 22.w,
                      colorFilter: ColorFilter.mode(
                        AppColors.fieldHintColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  )
                : null,
            prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
          ),
        ),
      ],
    );
  }
}
