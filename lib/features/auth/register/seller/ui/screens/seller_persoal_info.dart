import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/shared_widgets/app_text_field.dart';
import 'package:rizq/core/shared_widgets/custom_dropdown_button.dart';
import 'package:rizq/core/shared_widgets/custom_snack_bar.dart';
import 'package:rizq/core/shared_widgets/lang_drop_down.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/register/seller/logic/seller_register_cubit.dart';
import 'package:rizq/features/auth/register/seller/logic/seller_register_states.dart';
import 'package:rizq/features/auth/register/seller/ui/screens/seller_commercial_info.dart';
import 'package:rizq/features/auth/widgets/auth_custom_scaffold.dart';
import 'package:rizq/features/auth/widgets/form_validators.dart';
import 'package:rizq/features/auth/widgets/register_progrss_circles/register_progress_circles.dart';
import 'package:rizq/generated/locale_keys.g.dart';

import '../../../../../../core/router/route_manager.dart' show RouteManager;


class RegisterSellerPersonalInfoScreen extends StatelessWidget {
   RegisterSellerPersonalInfoScreen({super.key});

  final nameController = TextEditingController(text: kDebugMode?'ali': '');
  final emailController = TextEditingController(text: kDebugMode?'ali@dev.com': '');
  final phoneController = TextEditingController(text: kDebugMode?'01283416030': '');

  final passwordController = TextEditingController(text: kDebugMode?'Aa123456': '');
  final passwordConfirmController = TextEditingController(text: kDebugMode?'Aa123456': '');

  final formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      30.vGap,
                      Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: LangDropDown()),
                      20.vGap,
                      Image.asset(AppAssets.appLogoImage, width: 32.r, height: 37.r),
                      10.vGap,
                      Text.rich(
                        TextSpan(
                            children: [
                              TextSpan(
                                text: LocaleKeys.Auth_register_createSellerAccountInRizq.tr(context: context),
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
                          LocaleKeys.Auth_register_personalInfo.tr(context: context),
                          LocaleKeys.Auth_register_commercialInfo.tr(context: context),
                          LocaleKeys.Auth_register_additionalInfo.tr(context: context),
                        ],
                        currentPhaseIndex: 0,
                      ),
                      35.vGap,

                      Column(
                        spacing: 10.h,
                        children: [

                          AppTextField(
                            controller: nameController,
                            validator: FormValidators.nameValidator,
                            hint: LocaleKeys.Auth_name.tr(context: context),
                            title: LocaleKeys.Auth_userName.tr(context: context),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            prefixIcon: SvgImage(svgPath: AppAssets.userIconSvg, color: AppColors.fieldHintColor,),

                          ),

                          AppTextField(

                            controller: emailController,
                            validator: FormValidators.emailValidator,
                            hint: LocaleKeys.Auth_shortEmail.tr(context: context),
                            title: LocaleKeys.Auth_email.tr(context: context),
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            prefixIcon: SvgImage(svgPath: AppAssets.emailIconSvg, color: AppColors.fieldHintColor,),
                          ),

                          AppTextField(

                            controller: phoneController,
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
                            onSaved: (s){},

                            value: cubit.selectedState,
                            onChanged: (s){
                              if(s != null && s.isNotEmpty){
                                cubit.stateChanged(s);
                              }

                            },
                            prefixIcon: SvgImage(svgPath: AppAssets.stateIconSvg,  color: AppColors.fieldHintColor, ),
                            items: cubit.syriaStatesKeys,
                            validator: (s){
                              if(s == null || s.isEmpty){
                                return 'State is requried';
                              }
                              return null;
                            },
                          ),

                          AppTextField(

                            controller: passwordController,
                            validator: FormValidators.passwordValidator,
                            hint: LocaleKeys.Auth_password.tr(context: context),
                            title: LocaleKeys.Auth_password.tr(context: context),
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.next,
                            prefixIcon: SvgImage(svgPath: AppAssets.passwordIconSvg, color: AppColors.fieldHintColor,),
                          ),


                          AppTextField(

                            controller: passwordConfirmController,
                            validator: FormValidators.passwordValidator,
                            hint: LocaleKeys.Auth_confirmPassword.tr(context: context),
                            title: LocaleKeys.Auth_confirmPassword.tr(context: context),
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            prefixIcon: SvgImage(svgPath: AppAssets.passwordIconSvg, color: AppColors.fieldHintColor,),
                          ),
                        ],
                      ),
                      30.vGap,

                      PrimaryButton(
                        title: LocaleKeys.Auth_next.tr(context: context),
                        disabledColor: AppColors.disabledColor,
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            if(passwordController.text != passwordConfirmController.text){
                              showCustomSnackBar(message: LocaleKeys.formErrors_passwordAreNotIdentical.tr(context: context));
                              return;
                            }
                            RouteManager.navigateTo(RegisterSellerCommercialInfoScreen());
                          }

                        },
                      ),
                      25.vGap,

                    ],
                  ),
                ),
              ),
            );
      }),
    );
  }
}
