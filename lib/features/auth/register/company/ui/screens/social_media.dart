import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/app_text_field.dart';
import 'package:rizq/core/shared_widgets/custom_dropdown_button.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/register/company/ui/screens/additional_info.dart';
import 'package:rizq/features/auth/register/outer_screens/ui/successful_register_screen.dart';
import 'package:rizq/features/auth/register/seller/logic/seller_register_cubit.dart';
import 'package:rizq/features/auth/register/seller/logic/seller_register_states.dart';
import 'package:rizq/features/auth/register/seller/ui/screens/seller_additional_info.dart';
import 'package:rizq/features/auth/widgets/auth_custom_scaffold.dart';
import 'package:rizq/features/auth/widgets/description_text_field.dart';
import 'package:rizq/features/auth/widgets/media_picking/image_pick_widget.dart';
import 'package:rizq/features/auth/widgets/media_picking/media_constraints_text.dart';
import 'package:rizq/features/auth/widgets/register_progrss_circles/register_progress_circles.dart';
import 'package:rizq/generated/locale_keys.g.dart';


class RegisterCompanySocialMedia extends StatelessWidget {
  const RegisterCompanySocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>sl<SellerRegisterCubit>(),
      child: BlocBuilder<SellerRegisterCubit, SellerRegisterStates>(
          builder: (context,state){
            var cubit = context.read<SellerRegisterCubit>();
            return  AuthCustomScaffold(
              body: Padding(
                padding:  EdgeInsets.symmetric(horizontal: AppTheme.defaultEdgePadding),
                child: Column(
                  children: [

                    Image.asset(AppAssets.appLogoImage, width: 32.r, height: 37.r),
                    10.vGap,
                    Text.rich(
                      TextSpan(
                          children: [
                            TextSpan(
                              text: LocaleKeys.Auth_register_createCompanyAccountIn.tr(context: context),
                              style: AppTextStyles.poppinsTextStyle(
                                size: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.titleColor,
                              ),
                            ),
                            TextSpan(text: ' '),
                            TextSpan(
                              text: LocaleKeys.appName.tr(context: context),
                              style: AppTextStyles.poppinsTextStyle(
                                size: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFA843C),
                              ),
                            ),
                            TextSpan(text: ' '),
                            TextSpan(
                              text: '${LocaleKeys.Auth_register_now.tr(context: context)}...',
                              style: AppTextStyles.poppinsTextStyle(
                                size: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.titleColor,
                              ),
                            ),
                          ]
                      ),
                      textAlign: TextAlign.center,
                    ),
                    20.vGap,
                    RegisterProgressCircles(
                      phases: [
                        LocaleKeys.Auth_register_companyOwnerData.tr(context: context),
                        LocaleKeys.Auth_register_companyData.tr(context: context),
                        LocaleKeys.Auth_register_verificationFiles.tr(context: context),
                        LocaleKeys.Auth_register_socialMediaAccounts.tr(context: context),
                      ],
                      currentPhaseIndex: 3,
                    ),
                    35.vGap,

                    Column(
                      spacing: 10.h,
                      children: [

                        AppTextField(
                          hint: LocaleKeys.Auth_register_theLink.tr(context: context),
                          title:  LocaleKeys.Auth_register_facebookLink.tr(context: context),
                          keyboardType: TextInputType.url,
                          textInputAction: TextInputAction.next,
                          prefixIcon: SvgImage(svgPath: AppAssets.facebookLogoSvg, color: AppColors.fieldHintColor,),
                        ),

                        AppTextField(
                          hint: LocaleKeys.Auth_register_theLink.tr(context: context),
                          title:  LocaleKeys.Auth_register_whatsAppLink.tr(context: context),
                          keyboardType: TextInputType.url,
                          textInputAction: TextInputAction.next,
                          prefixIcon: SvgImage(svgPath: AppAssets.whatsAppIconSvg, color: AppColors.fieldHintColor,),
                        ),

                        AppTextField(
                          hint: LocaleKeys.Auth_register_theLink.tr(context: context),
                          title:  LocaleKeys.Auth_register_linkedinLink.tr(context: context),
                          keyboardType: TextInputType.url,
                          textInputAction: TextInputAction.next,
                          prefixIcon: SvgImage(svgPath: AppAssets.linkedinIconSvg, color: AppColors.fieldHintColor,),
                        ),

                        AppTextField(
                          hint: LocaleKeys.Auth_register_theLink.tr(context: context),
                          title:  LocaleKeys.Auth_register_instagramLink.tr(context: context),
                          keyboardType: TextInputType.url,
                          textInputAction: TextInputAction.done,
                          prefixIcon: SvgImage(svgPath: AppAssets.instagramIconSvg, color: AppColors.fieldHintColor,),
                        ),

                      ],
                    ),
                    30.vGap,

                    PrimaryButton(
                      title: LocaleKeys.Auth_next.tr(context: context),
                      disabledColor: AppColors.disabledColor,
                      onPressed: (){
                        RouteManager.navigateTo(SuccessfulRegisterScreen());
                      },
                    ),
                    25.vGap,

                  ],
                ),
              ),
            );
          }),
    );
  }
}
