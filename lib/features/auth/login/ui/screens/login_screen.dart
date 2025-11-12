import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/app_text_field.dart';
import 'package:rizq/core/shared_widgets/custom_text_button.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/login/ui/widgets/social_login_button.dart';
import 'package:rizq/features/auth/register/outer_screens/ui/user_role_screen.dart';
import 'package:rizq/features/auth/widgets/auth_custom_scaffold.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthCustomScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppTheme.defaultEdgePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            70.vGap,
            Image.asset(AppAssets.appLogoImage, width: 32.r, height: 37.r),
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
            ),

            20.vGap,

            AppTextField(
              hint: LocaleKeys.Auth_email.tr(),
              title: LocaleKeys.Auth_email.tr(),
              prefixIcon: SvgImage(svgPath: AppAssets.emailIconSvg),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
            ),
            20.vGap,

            AppTextField(
              hint: LocaleKeys.Auth_password.tr(),
              title: LocaleKeys.Auth_password.tr(),
              prefixIcon: SvgImage(svgPath: AppAssets.passwordIconSvg),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              textInputAction: TextInputAction.done,
            ),

            Align(
              alignment: AlignmentGeometry.xy(1, 0),
              child: CustomTextButton(
                child: Text(
                  LocaleKeys.Auth_forgotPassword.tr(),
                  style: AppTextStyles.poppinsTextStyle(
                    size: 14,
                    color: AppColors.errorBorderColor,
                  ),
                ),
                onPressed: () {},
              ),
            ),

            PrimaryButton(
              title: LocaleKeys.Auth_Login_login.tr(),
              onPressed: () {},
            ),

            50.vGap,

            // social login buttons
            Row(
              children: [
                Expanded(
                  child: SocialLoginButton(
                    text: LocaleKeys.Auth_Login_googleSignIn.tr(),
                    icon: SvgImage(svgPath: AppAssets.googleLogoSvg),
                    onPressed: () {},
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.r),
                  child: Text(
                    LocaleKeys.Auth_Login_or.tr(),
                    style: AppTextStyles.poppinsTextStyle(
                      size: 16,
                      color: AppColors.titleColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: SocialLoginButton(
                    text: LocaleKeys.Auth_Login_facebookSignIn.tr(),
                    icon: SvgImage(svgPath: AppAssets.facebookLogoSvg),
                    onPressed: () {},
                  ),
                ),
              ],
            ),

            // register button
            30.vGap,

            // create account text button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocaleKeys.Auth_Login_noAccount.tr(),
                  style: AppTextStyles.poppinsTextStyle(
                    size: 14,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                5.hGap,

                CustomTextButton(
                  child: Text(
                    LocaleKeys.Auth_Login_signUp.tr(),
                    style:
                        AppTextStyles.poppinsTextStyle(
                          size: 14,
                          color: AppColors.titleColor,
                          fontWeight: FontWeight.w500,
                        ).copyWith(
                          decorationStyle: TextDecorationStyle.solid,
                          decorationColor: AppColors.titleColor,
                          decoration: TextDecoration.underline,
                        ),
                  ),
                  onPressed: () {
                    RouteManager.navigateTo(UserRoleSelectionScreen());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
