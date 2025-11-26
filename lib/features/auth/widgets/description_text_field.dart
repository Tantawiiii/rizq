
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class DescriptionTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String title;
  final String hint;
  final TextInputAction textInputAction;
  final bool isEnabled;

  const DescriptionTextField({super.key, this.controller, required this.title, required this.hint, this.textInputAction = TextInputAction.done, this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Text(
          title,
          style: AppTextStyles.cairoTextStyle(
            size: 14,
            color: AppColors.fieldTitleColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        10.vGap,

        TextFormField(
          controller: controller,
          minLines: 4,
          maxLines: null,
          scrollPhysics: BouncingScrollPhysics(),
          cursorColor: AppColors.primaryColor,
          cursorErrorColor: AppColors.errorBorderColor,
          cursorWidth: 2,
          cursorRadius: Radius.circular(3),
          keyboardType: TextInputType.text,
          enabled: isEnabled,
          style: AppTextStyles.cairoTextStyle(
            size: 14,
            color: AppColors.greyTextColor,
          ),
          textInputAction: textInputAction,
          validator: (s){
            if(s == null || s.isEmpty){
              return 'required';
            }
            if(s.length < 25){
              return 'too short';
            }
            return null;
          },

          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTextStyles.cairoTextStyle(
              size: 13,
              color: AppColors.fieldHintColor,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: isEnabled? AppColors.white : Color(0xffEBEEF3),

            isDense: true,

            contentPadding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 13.r),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:  BorderSide(
                color: AppColors.textFieldBorderColor,
                width: 1.r,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:  BorderSide(
                color: AppColors.textFieldBorderColor,
                width: 1.r,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 1.r,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.errorBorderColor,
                width: 1.r,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide:  BorderSide(
                color: AppColors.primaryColor,
                width: 1.r,
              ),
            ),
          ),

        ),
      ],
    );
  }
}