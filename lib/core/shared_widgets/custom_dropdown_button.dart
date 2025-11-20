import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';

class CustomDropdownButton extends StatefulWidget {
  final String title;
  final List<String> items;
  final void Function(String? value)? onChanged;
  final String? Function(String? s)? validator;
  final String hint;
  final Widget? prefixIcon;
  final String? value;

  const CustomDropdownButton({
    super.key,
    required this.title,
    required this.items,
    this.validator,
    required this.hint,
    this.prefixIcon,
    this.value,
    this.onChanged,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppTextStyles.cairoTextStyle(
            size: 14,
            color: AppColors.fieldTitleColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        10.vGap,
        DropdownButtonFormField2<String>(
          items: widget.items
              .map(
                (key) => DropdownMenuItem<String>(
                  value: tr(key),
                  child: Container(
                    padding: EdgeInsets.all(8.r),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: .5,
                        color: AppColors.fieldHintColor,
                      ),
                    ),
                    child: Text(
                      tr(key),
                      style: AppTextStyles.cairoTextStyle(
                        size: 14,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: widget.onChanged,

          isExpanded: true,
          isDense: true,
          alignment: AlignmentDirectional.centerStart,
          value: widget.value,
          validator: widget.validator,

          menuItemStyleData: MenuItemStyleData(
            overlayColor: WidgetStatePropertyAll(AppColors.disabledColor),
          ),

          iconStyleData: IconStyleData(
              icon: Icon(Icons.keyboard_arrow_down, color: AppColors.fieldHintColor,)
          ),
          dropdownStyleData: DropdownStyleData(
            isOverButton: false,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
          ),

          selectedItemBuilder: (context) {
            return widget.items
                .map(
                  (key) => Text(
                    tr(key),
                    style: AppTextStyles.cairoTextStyle(
                      size: 14,
                      color: AppColors.primaryColor,
                    ),
                  ),
                )
                .toList();
          },
          decoration: InputDecoration(


            hint: Align(
              alignment: AlignmentDirectional.topStart,
              child: Text(
                widget.hint,
                style: AppTextStyles.cairoTextStyle(
                  size: 13,
                  color: AppColors.fieldHintColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            filled: true,
            fillColor: AppColors.white,
            isDense: true,
            prefixIcon: widget.prefixIcon != null ?Padding(
              padding: EdgeInsetsGeometry.directional(start: 10.r),
              child: widget.prefixIcon,
            ) : null,
            // prefix: prefixIcon,
            prefixIconConstraints: BoxConstraints(
              minWidth: 33.r,
              minHeight: 33.r,
            ),

            contentPadding: EdgeInsets.symmetric(
              horizontal: 15.r,
              vertical: 11.r,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.textFieldBorderColor,
                width: 1.r,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.r),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.errorBorderColor,
                width: 1.r,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
              borderSide: BorderSide(color: AppColors.primaryColor, width: 1.r),
            ),
          ),
        ),
      ],
    );
  }
}
