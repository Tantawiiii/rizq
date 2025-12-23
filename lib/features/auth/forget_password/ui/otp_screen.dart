import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/forget_password/logic/forget_password_cubit.dart';
import 'package:rizq/features/auth/forget_password/logic/forget_password_states.dart';
import 'package:rizq/features/auth/forget_password/ui/widgets/otp_resend_button.dart';
import 'package:rizq/features/auth/widgets/auth_custom_scaffold.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/primary_button.dart';

class OtpScreen extends StatefulWidget {

  final String email;
  const OtpScreen({super.key, required this.email});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? errorMessage ;
  final otpController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>sl<ForgetPasswordCubit>(),
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordStates>(
        builder: (context,state) {
          var cubit = context.read<ForgetPasswordCubit>();
          return AuthCustomScaffold(
            body: Padding(
              padding:  EdgeInsets.all(AppTheme.defaultEdgePadding),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Image.asset(AppAssets.appLogoImage, width: 32.r, height: 37.r),
                    20.vGap,
                    Text(
                      LocaleKeys.Auth_otp_weHaveSentCode.tr(context: context),
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.titleColor ,
                        fontWeight: FontWeight.w500,
                        size: 16
                      ),
                      textAlign: TextAlign.center,
                    ),
                    30.vGap,

                    Directionality(
                      textDirection: ui.TextDirection.ltr,
                      child: Pinput(
                        obscureText: false,
                        autofocus: true,
                        controller: otpController,
                        length: 6,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        textInputAction: TextInputAction.go,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        keyboardType: TextInputType.number,
                        animationCurve: Curves.easeInOut,
                        errorText: errorMessage,
                        forceErrorState: errorMessage != null,
                        errorTextStyle: AppTextStyles.cairoTextStyle(color: AppColors.errorBorderColor, size: 14),

                        animationDuration: Duration(milliseconds: 300),
                        closeKeyboardWhenCompleted: true,
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,

                        defaultPinTheme: PinTheme(
                            width: 50.w,
                            height: 50.w,
                            textStyle: AppTextStyles.cairoTextStyle(
                              color: AppColors.primaryColor,
                              size: 22,
                            ),
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(color: AppColors.borderGrayColor, width: .7)
                            )
                        ),
                        focusedPinTheme: PinTheme(
                            width: 50.w,
                            height: 50.w,
                            textStyle: AppTextStyles.cairoTextStyle(
                              color: AppColors.primaryColor,
                              size: 22,
                            ),
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(5.r),
                                border: Border.all(color: AppColors.primaryColor, width: 1)
                            )
                        ),
                        errorPinTheme: PinTheme(
                            width: 50.w,
                            height: 50.w,
                            textStyle: AppTextStyles.cairoTextStyle(
                              color: AppColors.primaryColor,
                              size: 24,
                            ),
                            padding: EdgeInsets.all(8.r),
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8.r),
                                border: Border.all(color: AppColors.errorBorderColor, width: 1)
                            )
                        ),
                        onSubmitted: (s){
                           bool isValid = formKey.currentState!.validate();
                           if(!isValid){
                             setState(() {});
                           }
                        },
                        onCompleted: (s){
                           final isValid = formKey.currentState!.validate();
                           if (isValid){
                             if(errorMessage != null)
                             {
                               setState(() {
                                 errorMessage = null;
                               });
                             }
                           }
                        },
                        validator: (s){
                           if(s == null || s.isEmpty){

                             return errorMessage =  LocaleKeys.formErrors_otpRequired.tr(context: context);
                           }
                           if(s.length < 6){
                             return errorMessage = LocaleKeys.formErrors_otpMissedDigits.tr(context: context);
                           }
                           return null;
                        },
                        pinAnimationType: PinAnimationType.slide,
                        pinContentAlignment: Alignment.center,
                        preFilledWidget: Text(
                          '-',
                          style: AppTextStyles.cairoTextStyle(
                            color: AppColors.fieldHintColor,
                            size: 14,
                          ),
                        ),

                      ),
                    ),

                    25.vGap,

                    PrimaryButton(
                        title: LocaleKeys.Auth_otp_checkCode.tr(context: context),
                      isLoading: state is ForgetPasswordLoadingState,
                      disabledColor: AppColors.primaryColor,
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          cubit.verifyOtp(email: widget.email, otp: otpController.text,);
                        }
                        else{
                          setState(() {});
                        }
                      },
                    ),
                    20.vGap,
                    OtpResendButton(email: widget.email,),

                    20.vGap,
                  ],
                ),
              ),
            ) ,
          );
        }
      ),
    );
  }
}
