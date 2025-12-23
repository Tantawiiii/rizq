import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/login/ui/screens/login_screen.dart';
import 'package:rizq/features/auth/outer_screens/cubit/general_register_cubit.dart';
import 'package:rizq/features/auth/outer_screens/cubit/general_register_states.dart';
import 'package:rizq/features/auth/outer_screens/ui/register_method_screen.dart';
import 'package:rizq/features/auth/outer_screens/ui/widgets/selectable_container.dart';
import 'package:rizq/features/auth/widgets/auth_custom_scaffold.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/primary_button.dart';
import 'package:rizq/shared_widgets/underline_text.dart';

class UserRoleSelectionScreen extends StatelessWidget {
  const UserRoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> sl<GeneralRegisterCubit>(),

      child: BlocBuilder<GeneralRegisterCubit, GeneralRegisterStates>(
        builder: (context, state) {
          var cubit = context.read<GeneralRegisterCubit>();

          return AuthCustomScaffold(
            body: Padding(
              padding:  EdgeInsets.symmetric(horizontal: AppTheme.defaultEdgePadding),
              child: Column(

                children: [
                  30.vGap,
                  Image.asset(AppAssets.appLogoImage, width: 32.r, height: 37.r,),
                  10.vGap,
                  Text(
                    LocaleKeys.Auth_register_chooseYourAccountType.tr(context: context),
                    style: AppTextStyles.cairoTextStyle(
                      size: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.titleColor,
                    ),
                  ),
                  30.vGap,
                  SelectableContainer(
                      svgPath: AppAssets.userIconSvg,
                      svgColor: AppColors.primaryColor,
                      text: LocaleKeys.Auth_register_personalAccount.tr(context: context),
                      isSelected: cubit.userRole == UserRole.normal,
                      onPressed: (){
                        cubit.changeUserRole(UserRole.normal);
                      }
                  ),
                  20.vGap,
                  SelectableContainer(
                      svgPath: AppAssets.sellerIconSvg,
                      svgColor: AppColors.primaryColor,
                      text: LocaleKeys.Auth_register_sellerAccount.tr(context: context),
                      isSelected: cubit.userRole == UserRole.seller,
                      onPressed: (){
                        cubit.changeUserRole(UserRole.seller);
                      }
                  ),
                  20.vGap,
                  SelectableContainer(
                      svgPath: AppAssets.companyIconSvg,
                      svgColor: AppColors.primaryColor,
                      text: LocaleKeys.Auth_register_companyAccount.tr(context: context),
                      isSelected: cubit.userRole == UserRole.company,
                      onPressed: (){
                        cubit.changeUserRole(UserRole.company);
                      }
                  ),
                  30.vGap,

                  PrimaryButton(
                    title: LocaleKeys.Auth_next.tr(),
                    disabledColor: AppColors.disabledColor,
                    onPressed: cubit.userRole == null? null:
                    (){
                      RouteManager.navigateTo(RegisterMethodSelectionScreen());
                    }
                    ,
                  ),

                  60.vGap,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        LocaleKeys.Auth_register_alreadyHaveAccount.tr(),
                        style: AppTextStyles.cairoTextStyle(
                          size: 14,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      5.hGap,
                      UnderlineText(
                          text: Text(
                              LocaleKeys.Auth_Login_login.tr(),
                              style: AppTextStyles.cairoTextStyle(
                                size: 14,
                                color: AppColors.titleColor,
                                fontWeight: FontWeight.w500,
                              )),
                        onPressed: (){
                            RouteManager.navigateTo(LoginScreen());
                        },
                      )
                    ],
                  ),

                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
