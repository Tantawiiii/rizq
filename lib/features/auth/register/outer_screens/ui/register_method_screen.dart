import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/custom_snack_bar.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/register/company/ui/screens/company_owner_data.dart';
import 'package:rizq/features/auth/register/outer_screens/cubit/general_register_cubit.dart';
import 'package:rizq/features/auth/register/outer_screens/cubit/general_register_states.dart';
import 'package:rizq/features/auth/register/outer_screens/ui/widgets/selectable_container.dart';
import 'package:rizq/features/auth/register/personal/ui/personal_register_screen.dart';
import 'package:rizq/features/auth/register/seller/ui/screens/seller_persoal_info.dart';
import 'package:rizq/features/auth/widgets/auth_custom_scaffold.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class RegisterMethodSelectionScreen extends StatelessWidget {
  const RegisterMethodSelectionScreen({super.key});


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
                      LocaleKeys.Auth_register_chooseRegisterWay.tr(context: context),
                      style: AppTextStyles.poppinsTextStyle(
                        size: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.titleColor,
                      ),
                    ),
                    30.vGap,
                    SelectableContainer(
                        svgPath: AppAssets.emailIconSvg,
                        svgColor: AppColors.primaryColor,
                        text: LocaleKeys.Auth_email.tr(context: context),
                        isSelected: cubit.registerMethod == RegisterMethod.email,
                        onPressed: (){
                          cubit.changeRegisterMethod(RegisterMethod.email);
                        }
                    ),
                    20.vGap,
                    SelectableContainer(
                        svgPath: AppAssets.googleLogoSvg,
                        text: LocaleKeys.Auth_Login_googleSignIn.tr(context: context),
                        isSelected: cubit.registerMethod == RegisterMethod.google,
                        svgColor: AppColors.primaryColor,
                        onPressed: (){
                          cubit.changeRegisterMethod(RegisterMethod.google);
                        }
                    ),
                    20.vGap,
                    SelectableContainer(
                        svgPath: AppAssets.facebookLogoSvg,
                        text: LocaleKeys.Auth_Login_facebookSignIn.tr(context: context),
                        isSelected: cubit.registerMethod == RegisterMethod.facebook,
                        svgColor: AppColors.primaryColor,
                        onPressed: (){
                          cubit.changeRegisterMethod(RegisterMethod.facebook);
                        }
                    ),
                    30.vGap,

                    PrimaryButton(
                      title: LocaleKeys.Auth_next.tr(),
                      disabledColor: AppColors.disabledColor,
                      onPressed: cubit.registerMethod == null? null:
                          (){
                        if(cubit.registerMethod != null && cubit.registerMethod != RegisterMethod.email){
                          showCustomSnackBar(message: 'this feature is still under development');
                        }
                        if(cubit.registerMethod == RegisterMethod.email){
                          switch(cubit.userRole){
                            case UserRole.personal: RouteManager.navigateTo(PersonalRegisterScreen()); break;
                            case UserRole.seller: RouteManager.navigateTo(RegisterSellerPersonalInfoScreen()); break;
                            case UserRole.company: RouteManager.navigateTo(RegisterCompanyOwnerData()); break;
                          }
                        }
                      }
                      ,
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
