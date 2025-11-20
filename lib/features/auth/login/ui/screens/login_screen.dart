import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/app_text_field.dart';
import 'package:rizq/core/shared_widgets/custom_text_button.dart';
import 'package:rizq/core/shared_widgets/lang_drop_down.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:rizq/features/auth/login/cubit/login_cubit.dart';
import 'package:rizq/features/auth/login/cubit/login_states.dart';
import 'package:rizq/features/auth/login/data/models/login_request_model.dart';
import 'package:rizq/features/auth/login/ui/widgets/social_login_button.dart';
import 'package:rizq/features/auth/outer_screens/ui/user_role_screen.dart';
import 'package:rizq/features/auth/widgets/auth_custom_scaffold.dart';
import 'package:rizq/features/auth/widgets/form_validators.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final TextEditingController emailController =  TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>sl<LoginCubit>(),
      child: BlocBuilder<LoginCubit, LoginStates>(
        builder: (context,state){
          var cubit = context.read<LoginCubit>();

          return AuthCustomScaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppTheme.defaultEdgePadding),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    30.vGap,
                    Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: LangDropDown()),
                    20.vGap,
                    Image.asset(AppAssets.appLogoImage, width: 32.r, height: 37.r),
                    10.vGap,
                    Text(
                      LocaleKeys.Auth_Login_welcomeBack.tr(context: context),
                      style: AppTextStyles.cairoTextStyle(
                        size: 24,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    10.vGap,

                    Text(
                      LocaleKeys.Auth_Login_loginAndExploreApp.tr(context: context),
                      style: AppTextStyles.cairoTextStyle(
                        size: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.titleColor,
                      ),
                    ),

                    20.vGap,

                    AppTextField(
                      controller: emailController,
                      validator: FormValidators.emailValidator,
                      hint: LocaleKeys.Auth_email.tr(),
                      title: LocaleKeys.Auth_email.tr(),
                      prefixIcon: SvgImage(svgPath: AppAssets.emailIconSvg),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    20.vGap,

                    AppTextField(
                      controller: passwordController,
                      validator: FormValidators.passwordValidator,
                      hint: LocaleKeys.Auth_password.tr(),
                      title: LocaleKeys.Auth_password.tr(),
                      prefixIcon: SvgImage(svgPath: AppAssets.passwordIconSvg),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                    ),

                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: CustomTextButton(
                        child: Text(
                          LocaleKeys.Auth_forgotPassword.tr(),
                          style: AppTextStyles.cairoTextStyle(
                            size: 14,
                            color: AppColors.errorBorderColor,
                          ),
                        ),
                        onPressed: () {
                          RouteManager.navigateTo(ForgetPasswordScreen());
                        },
                      ),
                    ),

                    PrimaryButton(
                      title: LocaleKeys.Auth_Login_login.tr(),
                      isLoading: state is LoginLoadingState,
                      onPressed: () {
                        if(formKey.currentState!.validate()){
                          cubit.login(loginModel: LoginRequestModel(email: emailController.text, password: passwordController.text));
                        }

                      },
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
                            style: AppTextStyles.cairoTextStyle(
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
                          style: AppTextStyles.cairoTextStyle(
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
                            AppTextStyles.cairoTextStyle(
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
            ),
          );
        },
      ),
    );
  }
}
