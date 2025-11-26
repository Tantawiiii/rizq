import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/generated/locale_keys.g.dart';


class StopAlertDialog extends StatelessWidget {
  const StopAlertDialog({super.key});
  @override
  Widget build(BuildContext context) {

    return Dialog(
      elevation: 2,
      clipBehavior: Clip.none,
      insetAnimationCurve: Curves.easeInOut,
      insetAnimationDuration: Duration(seconds: 1),
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 24.r, vertical: 16.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: Colors.white,
        ),
        child: Column(
          spacing: 20.r,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              LocaleKeys.Settings_stopAlerts.tr(context: context),
              style: AppTextStyles.cairoTextStyle(
                size: 20,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              LocaleKeys.Settings_stopAlertsQuestion.tr(),
              style: AppTextStyles.cairoTextStyle(
                size: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.titleColor,
              ),
              textAlign: TextAlign.center,
            ),
            10.vGap,
            Row(
              spacing: 15.r,
              children: [
                Expanded(
                  child: PrimaryButton(
                    title: LocaleKeys.Settings_confirm.tr(context: context),
                    onPressed: (){},
                  ),
                ),
                Expanded(
                  child: PrimaryButton(
                    title: LocaleKeys.Settings_cancel.tr(),
                    backgroundColor: Color(0xffDCF1FF),
                    textStyle: AppTextStyles.cairoTextStyle(
                      fontWeight: FontWeight.w500,
                      size: 16,
                      color: AppColors.titleColor,
                    ),
                    onPressed: ()=>RouteManager.pop(),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}