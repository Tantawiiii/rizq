import 'package:flutter/material.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';

class MediaConstraintsText extends StatelessWidget {
  final String title;
  final List<String> constraints;

  const MediaConstraintsText({super.key, required this.title, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          title,
          style: AppTextStyles.poppinsTextStyle(
            size: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.primaryColor,
          ),
        ),
        8.vGap,
        ...constraints.map((s)=>Text(
          '${constraints.indexOf(s) +1 }: ${s}',
          style: AppTextStyles.poppinsTextStyle(
            size: 12,
            color: AppColors.titleColor,
          ),
        ))
      ],
    );
  }
}
