import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/login/ui/screens/login_screen.dart';
import 'package:rizq/features/auth/outer_screens/ui/widgets/gif_player_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/primary_button.dart';

class SuccessfulRegisterScreen extends StatelessWidget {
  final UserRole registeredRole;
  const SuccessfulRegisterScreen({super.key, required this.registeredRole});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: AppTheme.defaultEdgePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              30.vGap,
              Expanded(
                  flex: 2,
                  child: GifPlayerWidget(gifPath: AppAssets.successfulRegistrationGif),),
              30.vGap,
              Expanded(
                flex: 3,
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    Text(
                      LocaleKeys.Auth_register_congrats.tr(context: context),
                      style: AppTextStyles.cairoTextStyle(
                        size: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    registeredRole.isNormal?
                    Text(
                      LocaleKeys.Auth_register_successfulRegistration.tr(context: context),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.cairoTextStyle(
                        size: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ) :
                    Text(
                      LocaleKeys.Auth_register_successfulRegistrationForSellerCompany.tr(context: context),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.cairoTextStyle(
                        size: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor,
                      ),
                    ) ,

                    25.vGap,

                    PrimaryButton(
                      title: LocaleKeys.Auth_register_goLogin.tr(context: context),
                      onPressed: (){
                        RouteManager.navigateAndPopAll(LoginScreen());
                      },
                    )


                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
