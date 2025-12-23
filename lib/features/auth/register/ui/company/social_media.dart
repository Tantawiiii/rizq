import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/register/logic/register_cubit.dart';
import 'package:rizq/features/auth/register/logic/register_states.dart';
import 'package:rizq/features/auth/widgets/auth_custom_scaffold.dart';
import 'package:rizq/features/auth/widgets/progress_indicator_button.dart';
import 'package:rizq/features/auth/widgets/register_progrss_circles/register_progress_circles.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/app_text_field.dart';
import 'package:rizq/shared_widgets/primary_button.dart';
import 'package:rizq/shared_widgets/svg_image.dart';


class RegisterCompanySocialMedia extends StatelessWidget {
  RegisterCompanySocialMedia({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterStates>(
        builder: (context,state){
          var cubit = context.read<RegisterCubit>();
          return  AuthCustomScaffold(
            body: Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppTheme.defaultEdgePadding),
              child: Form(
                key: formKey,
                child: Column(
                  children: [

                    Image.asset(AppAssets.appLogoImage, width: 32.r, height: 37.r),
                    10.vGap,
                    Text.rich(
                      TextSpan(
                          children: [
                            TextSpan(
                              text: LocaleKeys.Auth_register_createCompanyAccountIn.tr(context: context),
                              style: AppTextStyles.cairoTextStyle(
                                size: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.titleColor,
                              ),
                            ),
                            TextSpan(text: ' '),
                            TextSpan(
                              text: LocaleKeys.appName.tr(context: context),
                              style: AppTextStyles.cairoTextStyle(
                                size: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xffFA843C),
                              ),
                            ),
                            TextSpan(text: ' '),
                            TextSpan(
                              text: '${LocaleKeys.Auth_register_now.tr(context: context)}...',
                              style: AppTextStyles.cairoTextStyle(
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
                          controller: cubit.facebookLinkController,
                          hint: LocaleKeys.Auth_register_theLink.tr(context: context),
                          title:  LocaleKeys.Auth_register_facebookLink.tr(context: context),
                          keyboardType: TextInputType.url,
                          textInputAction: TextInputAction.next,
                          prefixIcon: SvgImage(svgPath: AppAssets.facebookLogoSvg, color: AppColors.fieldHintColor,),
                        ),

                        AppTextField(
                          controller: cubit.whatsAppLinkController,
                          hint: LocaleKeys.Auth_register_theLink.tr(context: context),
                          title:  LocaleKeys.Auth_register_whatsAppLink.tr(context: context),
                          keyboardType: TextInputType.url,
                          textInputAction: TextInputAction.next,
                          prefixIcon: SvgImage(svgPath: AppAssets.whatsAppIconSvg, color: AppColors.fieldHintColor,),
                        ),

                        AppTextField(
                          controller: cubit.linkedInLinkController,
                          hint: LocaleKeys.Auth_register_theLink.tr(context: context),
                          title:  LocaleKeys.Auth_register_linkedinLink.tr(context: context),
                          keyboardType: TextInputType.url,
                          textInputAction: TextInputAction.next,
                          prefixIcon: SvgImage(svgPath: AppAssets.linkedinIconSvg, color: AppColors.fieldHintColor,),
                        ),

                        AppTextField(
                          controller: cubit.instagramLinkController,
                          hint: LocaleKeys.Auth_register_theLink.tr(context: context),
                          title:  LocaleKeys.Auth_register_instagramLink.tr(context: context),
                          keyboardType: TextInputType.url,
                          textInputAction: TextInputAction.done,
                          prefixIcon: SvgImage(svgPath: AppAssets.instagramIconSvg, color: AppColors.fieldHintColor,),
                        ),

                      ],
                    ),
                    30.vGap,

                    state is RegisterUploadingStateChanged?
                    ProgressIndicatorButton(value: state.progress):

                    PrimaryButton(
                      title: LocaleKeys.Auth_next.tr(context: context),
                      disabledColor: AppColors.primaryColor,
                      isLoading: state is RegisterLoadingState,
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          cubit.registerUser(role: UserRole.company);
                        }

                      },
                    ),
                    25.vGap,

                  ],
                ),
              ),
            ),
          );
        });
  }
}
