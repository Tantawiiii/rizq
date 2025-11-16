import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/app_text_field.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/otp/ui/otp_screen.dart';
import 'package:rizq/features/auth/widgets/auth_custom_scaffold.dart';
import 'package:rizq/features/auth/widgets/form_validators.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({super.key});

   final emailController = TextEditingController(text: "ali@dev.com");
   final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                LocaleKeys.Auth_forgetPassword_enterEmailToSendCode.tr(context: context),
                style: AppTextStyles.poppinsTextStyle(
                    color: AppColors.titleColor ,
                    fontWeight: FontWeight.w500,
                    size: 16
                ),
                textAlign: TextAlign.center,
              ),
              30.vGap,

              AppTextField(
                controller: emailController,
                validator: FormValidators.emailValidator,
                hint: LocaleKeys.Auth_shortEmail.tr(context: context),
                title: LocaleKeys.Auth_email.tr(context: context),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                prefixIcon: SvgImage(svgPath: AppAssets.emailIconSvg, color: AppColors.fieldHintColor,),
              ),

              30.vGap,

              PrimaryButton(
                title: LocaleKeys.Auth_forgetPassword_sendCode.tr(context: context),
                disabledColor: AppColors.disabledColor,
                onPressed: (){
                  RouteManager.navigateTo(OtpScreen(comingFromRegister: false,));
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
