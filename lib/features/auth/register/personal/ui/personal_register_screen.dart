import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/shared_widgets/app_text_field.dart';
import 'package:rizq/core/shared_widgets/custom_dropdown_button.dart';
import 'package:rizq/core/shared_widgets/lang_drop_down.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/register/personal/logic/personal_register_cubit.dart';
import 'package:rizq/features/auth/register/personal/logic/personal_register_states.dart';
import 'package:rizq/features/auth/widgets/auth_custom_scaffold.dart';
import 'package:rizq/generated/locale_keys.g.dart';


class PersonalRegisterScreen extends StatelessWidget {
  const PersonalRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>sl<PersonalRegisterCubit>(),

    child: BlocBuilder<PersonalRegisterCubit, PersonalRegisterStates>(
        builder: (context,state){
          var cubit = context.read<PersonalRegisterCubit>();

         return  AuthCustomScaffold(
            body: Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppTheme.defaultEdgePadding),
              child: Column(
                children: [
                  30.vGap,
                  Align(
                      alignment: AlignmentGeometry.xy(-1, 0),
                      child: LangDropDown()),
                  20.vGap,
                  Image.asset(AppAssets.appLogoImage, width: 32.r, height: 37.r),
                  10.vGap,
                  Text(
                    LocaleKeys.Auth_register_createYourAccountAndExplore.tr(context: context),
                    style: AppTextStyles.poppinsTextStyle(
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.titleColor,
                    ),
                  ),

                  35.vGap,

                  Column(
                    spacing: 10.h,
                    children: [

                      AppTextField(
                        hint: LocaleKeys.Auth_name.tr(context: context),
                        title: LocaleKeys.Auth_userName.tr(context: context),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        prefixIcon: SvgImage(svgPath: AppAssets.userIconSvg, color: AppColors.fieldHintColor,),

                      ),

                      AppTextField(
                        hint: LocaleKeys.Auth_shortEmail.tr(context: context),
                        title: LocaleKeys.Auth_email.tr(context: context),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        prefixIcon: SvgImage(svgPath: AppAssets.emailIconSvg, color: AppColors.fieldHintColor,),
                      ),

                      AppTextField(
                        hint: LocaleKeys.Auth_phone.tr(context: context),
                        title: LocaleKeys.Auth_phone.tr(context: context),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        prefixIcon: SvgImage(svgPath: AppAssets.phoneIconSvg, color: AppColors.fieldHintColor,),
                      ),
                      //TODO: STATE
                      CustomDropdownButton(
                        title: LocaleKeys.Auth_state.tr(context: context),
                        hint: LocaleKeys.Auth_state.tr(context: context),
                        onSaved: (s){},
                        value: cubit.selectedState == null ? null : tr(cubit.selectedState!),
                        onChanged: (s){
                          if(s != null && s.isNotEmpty){
                            cubit.stateChanged(s);
                          }

                        },
                        prefixIcon: SvgImage(svgPath: AppAssets.stateIconSvg,  color: AppColors.fieldHintColor, ),
                        items: cubit.syriaStatesKeys.map((e)=>tr(e)).toList(),
                        validator: (s){
                          if(s == null || s.isEmpty){
                            return 'State is requried';
                          }
                          return null;
                        },
                      ),

                      AppTextField(
                        hint: LocaleKeys.Auth_password.tr(context: context),
                        title: LocaleKeys.Auth_password.tr(context: context),
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        prefixIcon: SvgImage(svgPath: AppAssets.passwordIconSvg, color: AppColors.fieldHintColor,),
                      ),


                      AppTextField(
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
                    title: LocaleKeys.Auth_Login_signUp.tr(context: context),
                    disabledColor: AppColors.disabledColor,
                    onPressed: (){},
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
