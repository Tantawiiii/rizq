import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/utils/extension_methods.dart';

import '../constant/app_colors.dart';
import '../theme/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    required this.hint,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.onFieldSubmitted,
    required this.title,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String hint;
  final String title;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final ValueChanged<String>? onFieldSubmitted;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {

  bool isPasswordShown = false;

  @override
  void initState(){
    super.initState();
    isPasswordShown = widget.obscureText;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          widget.title,
          style: AppTextStyles.poppinsTextStyle(
            size: 14,
            color: AppColors.fieldTitleColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        10.vGap,
        TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          obscureText: isPasswordShown,
          validator: widget.validator,
          onChanged: widget.onChanged,
          onFieldSubmitted: widget.onFieldSubmitted,
          style: AppTextStyles.poppinsTextStyle(
            size: 14,
            color: AppColors.greyTextColor,
          ),

          scrollPhysics: BouncingScrollPhysics(),
          cursorColor: AppColors.primaryColor,
          cursorErrorColor: AppColors.errorBorderColor,
          cursorWidth: 2,
          cursorRadius: Radius.circular(3),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: AppTextStyles.poppinsTextStyle(
              size: 13,
              color: AppColors.fieldHintColor,
              fontWeight: FontWeight.w400,
            ),
            filled: true,
            fillColor: AppColors.white,
            isDense: true,
            prefixIcon: Padding(
              padding:  EdgeInsetsGeometry.directional(start: 10.r),
              child: widget.prefixIcon,
            ),
           // prefix: prefixIcon,
            prefixIconConstraints: BoxConstraints(
              minWidth: 33.r,
              minHeight: 33.r,

            ),
             suffixIconConstraints: BoxConstraints(
                maxWidth: 50.r,
                maxHeight: 40.r,
             ),
            suffixIcon: widget.obscureText? Padding(
              padding:  EdgeInsetsDirectional.only(end: 5.r),
              child: IconButton(
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.zero),
                ),
                onPressed: (){
                setState(() {
                  isPasswordShown = !isPasswordShown;
                });
              }, icon:Icon( isPasswordShown? Icons.visibility_off_outlined : Icons.visibility_outlined, color: AppColors.fieldHintColor,),
              ),
            )
                : widget.suffixIcon,
            contentPadding: EdgeInsets.symmetric(horizontal: 15.r, vertical: 13.r),
            enabledBorder: OutlineInputBorder(
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

