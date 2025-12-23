
import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/features/auth/forget_password/logic/forget_password_cubit.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/custom_text_button.dart';


class OtpResendButton extends StatefulWidget {
  final String email;
  const OtpResendButton({super.key, required this.email});

  @override
  State<OtpResendButton> createState() => _OtpResendButtonState();
}

class _OtpResendButtonState extends State<OtpResendButton> {
  int noSeconds = 120;
  Timer? timer;

  void startTimer(){
    timer?.cancel();

    timer = Timer.periodic(Duration(seconds: 1), (t){
      if(noSeconds > 0){
        setState(() {
          noSeconds--;
        });
      }
      else{
        resetAll();
      }
    });
  }

  void resetAll(){
    setState(() {
      noSeconds = 120;
      timer?.cancel();
    });
  }
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      child: noSeconds < 120 ?

      Text(_formatTime(noSeconds),
      style: AppTextStyles.cairoTextStyle(
        color: AppColors.orangeColor,
        size: 14,
        fontWeight: FontWeight.w500,
       ),
      )
          :Text(
        LocaleKeys.Auth_otp_resendCode.tr(context: context),
        style: AppTextStyles.cairoTextStyle(
          color: AppColors.titleColor,
          fontWeight: FontWeight.w600,
          size: 16,
        )
      ),
      onPressed: () {
        if(noSeconds < 120){
          return;
        }

        startTimer();
        context.read<ForgetPasswordCubit>().resendOtp(email: widget.email);

      },
    );
  }

  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = remainingSeconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }
}