import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:rizq/features/auth/widgets/form_validators.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/shared_widgets/app_text_field.dart';
import 'package:rizq/shared_widgets/svg_image.dart';
import 'package:rizq/shared_widgets/underline_text.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: AppBarBackButton(),
          actionsPadding: EdgeInsets.symmetric(horizontal: 12.r),
          actions: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Text(
                LocaleKeys.Settings_save.tr(),
                style: AppTextStyles.cairoTextStyle(
                  color: Colors.white,
                  size: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
          title: Text(
            LocaleKeys.Settings_changePassword.tr(context: context),
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: AppColors.whiteBackground,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppTheme.defaultEdgePadding),
            child: Column(
              spacing: 15.r,
              children: [
                15.vGap,


                AppTextField(
                  validator: FormValidators.passwordValidator,
                  hint: LocaleKeys.Auth_password.tr(context: context),
                  title: LocaleKeys.Settings_currentPassword.tr(context: context),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  prefixIcon: SvgImage(svgPath: AppAssets.passwordIconSvg, color: AppColors.fieldHintColor,),
                ),


                AppTextField(
                  validator: FormValidators.passwordValidator,
                  hint: LocaleKeys.Auth_password.tr(context: context),
                  title: LocaleKeys.Settings_newPassword.tr(context: context),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  prefixIcon: SvgImage(svgPath: AppAssets.passwordIconSvg, color: AppColors.fieldHintColor,),
                ),


                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: UnderlineText(
                    text: Text(
                      LocaleKeys.Settings_forgetPassword.tr(),
                      style: AppTextStyles.cairoTextStyle(
                        size: 16,
                        color: AppColors.errorBorderColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: ()=>RouteManager.navigateTo(ForgetPasswordScreen()),
                  ),
                  
                ),
                30.vGap,
              ],
            ),
          ),
        )
    );
  }
}

