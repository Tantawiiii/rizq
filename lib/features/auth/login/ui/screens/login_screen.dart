import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/shared_widgets/app_text_field.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/widgets/auth_custom_scaffold.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthCustomScaffold(
      body: Padding(
        padding:  EdgeInsets.all(15.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            135.vGap,
            Image.asset(AppAssets.appLogoImage, width: 32.r, height: 37.r,),
            10.vGap,
            Text(
              LocaleKeys.Auth_Login_welcomeBack.tr(context: context),
              style: AppTextStyles.poppinsTextStyle(
                size: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
            ),
            10.vGap,

            Text(
              LocaleKeys.Auth_Login_loginAndExploreApp.tr(context: context),
              style: AppTextStyles.poppinsTextStyle(
                size: 14,
                fontWeight: FontWeight.w500,
                color: AppColors.titleColor,
              ),
            ) ,

            AppTextField(
              hint: LocaleKeys.Auth_email.tr(),
              label: LocaleKeys.Auth_email.tr(),
              prefixIcon: SvgImage(svgPath: AppAssets.emailIconSvg, width: 16.r, height: 16.r,),
            ),
            AppTextField(
              hint: LocaleKeys.Auth_password.tr(),
              label: LocaleKeys.Auth_password.tr(),
              prefixIcon: SvgImage(svgPath: AppAssets.passwordIconSvg, width: 16.r, height: 16.r,),
            ),


          ],
        ),
      ),
    );
  }
}
