import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/widgets/form_validators.dart';
import 'package:rizq/features/auth/widgets/media_picking/image_pick_widget.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/common_screens/reset_password_screen.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/main.dart';
import 'package:rizq/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/shared_widgets/app_text_field.dart';
import 'package:rizq/shared_widgets/custom_dropdown_button.dart';
import 'package:rizq/shared_widgets/svg_image.dart';
import 'package:rizq/shared_widgets/underline_text.dart';

class UpdatePersonalInfoScreen extends StatelessWidget {
  const UpdatePersonalInfoScreen({super.key});

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
            LocaleKeys.Settings_changePersonalInfo.tr(context: context),
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
                // avatar and update button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImagePickWidget(
                      onImagePicked: (f){},
                      initialImageUrl: 'https://fakeImage.com', // will fail to app logo
                    ),
                    Row(
                      spacing: 15.r,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Text(
                            LocaleKeys.Settings_modify.tr(),
                            style: AppTextStyles.cairoTextStyle(
                              color: Colors.white,
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
                          decoration: BoxDecoration(
                            color: AppColors.errorBorderColor,
                            borderRadius: BorderRadius.circular(24.r),
                          ),
                          child: Text(
                            LocaleKeys.Settings_delete.tr(),
                            style: AppTextStyles.cairoTextStyle(
                              color: Colors.white,
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )

                  ],
                ),
                5.vGap,


                AppTextField(
                  validator: FormValidators.nameValidator,
                  hint: LocaleKeys.Auth_name.tr(context: context),
                  title: LocaleKeys.Auth_userName.tr(context: context),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  prefixIcon: SvgImage(svgPath: AppAssets.userIconSvg, color: AppColors.fieldHintColor,),

                ),

                AppTextField(
                  validator: FormValidators.emailValidator,
                  hint: LocaleKeys.Auth_shortEmail.tr(context: context),
                  title: LocaleKeys.Auth_email.tr(context: context),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  prefixIcon: SvgImage(svgPath: AppAssets.emailIconSvg, color: AppColors.fieldHintColor,),
                ),

                AppTextField(
                  validator: FormValidators.phoneValidator,
                  hint: LocaleKeys.Auth_phone.tr(context: context),
                  title: LocaleKeys.Auth_phone.tr(context: context),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  prefixIcon: SvgImage(svgPath: AppAssets.phoneIconSvg, color: AppColors.fieldHintColor,),
                ),

                CustomDropdownButton(
                  title: LocaleKeys.Auth_state.tr(context: context),
                  hint: LocaleKeys.Auth_state.tr(context: context),

                  value: tr(syriaStatesKeys[0]),
                  items: syriaStatesKeys,
                  onChanged: (s) {},
                  prefixIcon: SvgImage(svgPath: AppAssets.stateIconSvg,  color: AppColors.fieldHintColor, ),
                  validator: FormValidators.stateValidator,
                ),

                AppTextField(
                  validator: FormValidators.passwordValidator,
                  hint: LocaleKeys.Auth_password.tr(context: context),
                  title: LocaleKeys.Auth_password.tr(context: context),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  prefixIcon: SvgImage(svgPath: AppAssets.passwordIconSvg, color: AppColors.fieldHintColor,),
                ),


                AppTextField(
                  validator: FormValidators.passwordValidator,
                  hint: LocaleKeys.Auth_confirmPassword.tr(context: context),
                  title: LocaleKeys.Auth_confirmPassword.tr(context: context),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  prefixIcon: SvgImage(svgPath: AppAssets.passwordIconSvg, color: AppColors.fieldHintColor,),
                ),


                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: UnderlineText(
                    text: Text(
                      LocaleKeys.Settings_changePassword.tr(),
                      style: AppTextStyles.cairoTextStyle(
                        size: 16,
                        color: AppColors.errorBorderColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: ()=>RouteManager.navigateTo(ResetPasswordScreen()),
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

