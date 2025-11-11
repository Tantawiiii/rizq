import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/app_colors.dart';
import '../theme/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
    this.height,
    this.icon,
    this.iconLeading = true,
    this.iconSpacing = 12,
    this.backgroundColor,
    this.disabledColor,
    this.backgroundGradient,
    this.borderRadius,
    this.padding,
  });

  final String title;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? height;
  final Widget? icon;
  final bool iconLeading;
  final double iconSpacing;
  final Color? backgroundColor;
  final Color? disabledColor;
  final Gradient? backgroundGradient;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = isLoading || onPressed == null;
    final Color fallbackColor = backgroundColor ?? AppColors.primaryColor;
    final Color effectiveDisabledColor =
        disabledColor ?? fallbackColor.withOpacity(0.6);
    final Gradient? effectiveGradient = isDisabled ? null : backgroundGradient;

    return Bounce(
      onTap: isDisabled ? null : onPressed,
      duration: const Duration(milliseconds: 140),
      tilt: false,
      child: SizedBox(
        width: double.infinity,
        height: height ?? 56.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: effectiveGradient == null
                ? (isDisabled ? effectiveDisabledColor : fallbackColor)
                : null,
            gradient: effectiveGradient,
            borderRadius: borderRadius ?? BorderRadius.circular(28.r),
          ),
          child: Padding(
            padding: padding ?? EdgeInsets.symmetric(horizontal: 20.w),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      height: 20.w,
                      width: 20.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.4,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.white,
                        ),
                      ),
                    )
                  : _buildLabel(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel() {
    final textWidget = Text(
      title,
      style: AppTextStyles.cairoTextStyle(
        size: 18,
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );

    if (icon == null) {
      return textWidget;
    }

    final spacingWidget = SizedBox(width: iconSpacing.w);

    final children = iconLeading
        ? <Widget>[
            Flexible(child: icon!),
            spacingWidget,
            Flexible(child: textWidget),
          ]
        : <Widget>[
            Flexible(child: textWidget),
            spacingWidget,
            Flexible(child: icon!),
          ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
