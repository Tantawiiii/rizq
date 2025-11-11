import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    required this.label,
    required this.hint,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String label;
  final String hint;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.cairoTextStyle(
            size: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
        12.verticalSpace,
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          validator: validator,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          style: AppTextStyles.cairoTextStyle(
            size: 16,
            color: AppColors.greyTextColor,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.cairoTextStyle(
              size: 15,
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: AppColors.white,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 16.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(
                color: AppColors.textFieldBorderColor,
                width: 1.4,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(
                color: AppColors.primaryColor,
                width: 1.6,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(
                color: AppColors.errorBorderColor,
                width: 1.4,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: const BorderSide(
                color: AppColors.errorBorderColor,
                width: 1.6,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

