import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/primary_button.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRefresh;

  const CustomErrorWidget({super.key, required this.errorMessage, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
      child: Column(
        children: [
          SizedBox(
            height: context.screenHeight * 0.65,
            child: Lottie.asset(
              AppAssets.errorLottie,
              repeat: true,
            ),
          ),
          30.vGap,
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10.r),

            ),
            child: Row(
              spacing: 10.r,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info, color: AppColors.primaryColor,),
                Expanded(
                  child: Text(
                    errorMessage,
                    style: AppTextStyles.cairoTextStyle(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          20.vGap,
          PrimaryButton(
            title: LocaleKeys.formErrors_retry.tr(context: context),
            onPressed: onRefresh,
          ),
          80.vGap,
        ],
      ),
    );
  }
}