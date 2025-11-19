import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/app_text_field.dart';
import 'package:rizq/core/shared_widgets/custom_snack_bar.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/forget_password/data/models/reser_password_request_model.dart';
import 'package:rizq/features/auth/forget_password/logic/forget_password_cubit.dart';
import 'package:rizq/features/auth/forget_password/logic/forget_password_states.dart';
import 'package:rizq/features/auth/forget_password/ui/successful_password_reset_screen.dart';
import 'package:rizq/features/auth/widgets/auth_custom_scaffold.dart';
import 'package:rizq/features/auth/widgets/form_validators.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class PasswordResetScreen extends StatelessWidget {
  final String email;
  final String otp;

  final firstPasswordController = TextEditingController(text: "Aa123456");
  final secondPasswordController = TextEditingController(text: "Aa123456");
  final formKey = GlobalKey<FormState>();

  PasswordResetScreen({super.key, required this.email, required this.otp});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ForgetPasswordCubit>(),
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordStates>(
        builder: (context, state) {
          var cubit = context.read<ForgetPasswordCubit>();
          return AuthCustomScaffold(
            body: Padding(
              padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Image.asset(
                      AppAssets.appLogoImage,
                      width: 32.r,
                      height: 37.r,
                    ),
                    20.vGap,
                    Text(
                      LocaleKeys.Auth_forgetPassword_createNewPassword.tr(
                        context: context,
                      ),
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.titleColor,
                        fontWeight: FontWeight.w500,
                        size: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    30.vGap,

                    AppTextField(
                      controller: firstPasswordController,
                      validator: FormValidators.passwordValidator,
                      hint: LocaleKeys.Auth_password.tr(context: context),
                      title: LocaleKeys.Auth_forgetPassword_newPassword.tr(
                        context: context,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      prefixIcon: SvgImage(
                        svgPath: AppAssets.passwordIconSvg,
                        color: AppColors.fieldHintColor,
                      ),
                    ),
                    15.vGap,
                    AppTextField(
                      controller: secondPasswordController,
                      validator: FormValidators.passwordValidator,
                      hint: LocaleKeys.Auth_password.tr(context: context),
                      title:
                          LocaleKeys.Auth_forgetPassword_confirmNewPassword.tr(
                            context: context,
                          ),
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      prefixIcon: SvgImage(
                        svgPath: AppAssets.passwordIconSvg,
                        color: AppColors.fieldHintColor,
                      ),
                    ),

                    25.vGap,

                    PrimaryButton(
                      title: LocaleKeys.Auth_forgetPassword_confirmPassword.tr(
                        context: context,
                      ),
                      disabledColor: AppColors.disabledColor,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (firstPasswordController.text !=
                              secondPasswordController.text) {
                            showCustomSnackBar(
                              message: LocaleKeys
                                  .formErrors_passwordAreNotIdentical
                                  .tr(),
                            );
                            return;
                          }
                          cubit.resetPassword(
                            resetPasswordRequestModel:
                                ResetPasswordRequestModel(
                                  email: email,
                                  otp: otp,
                                  password: firstPasswordController.text,
                                  passwordConfirmation:
                                      secondPasswordController.text,
                                ),
                          );
                        }
                      },
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
