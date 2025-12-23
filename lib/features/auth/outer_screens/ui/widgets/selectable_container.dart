import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/shared_widgets/svg_image.dart';

class SelectableContainer extends StatelessWidget {
  final bool isSelected ;
  final String text;
  final String svgPath;
  final VoidCallback onPressed;
  final Color? svgColor;

  const SelectableContainer({super.key, required this.svgPath, this.svgColor , required this.text, required this.isSelected, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(isSelected? 5.r: 24.r),
          border: Border.all(width: isSelected ? 2.r: .5.r, color: isSelected? AppColors.primaryColor : AppColors.borderGrayColor),
        ),
        child: Row(
          children: [
            SvgImage(
                svgPath: svgPath,
              color: svgColor,
            ),
            12.hGap,
            Text(
              text,
              style: AppTextStyles.cairoTextStyle(
                size: 14,
                fontWeight: FontWeight.w500,
                color:  AppColors.primaryColor,
              )
            )
          ],
        ),
      ),
    );
  }
}
