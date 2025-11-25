import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';

class FieldItemWidget extends StatelessWidget {
  const FieldItemWidget({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

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
        if (value.isNotEmpty) ...[
          4.verticalSpace,
          Text(
            value,
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
}

