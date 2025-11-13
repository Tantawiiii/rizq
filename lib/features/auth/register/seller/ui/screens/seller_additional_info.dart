import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/app_text_field.dart';
import 'package:rizq/core/shared_widgets/custom_dropdown_button.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/register/outer_screens/ui/successful_register_screen.dart';
import 'package:rizq/features/auth/register/seller/logic/seller_register_cubit.dart';
import 'package:rizq/features/auth/register/seller/logic/seller_register_states.dart';
import 'package:rizq/features/auth/widgets/auth_custom_scaffold.dart';
import 'package:rizq/features/auth/widgets/description_text_field.dart';
import 'package:rizq/features/auth/widgets/media_picking/file_picking_widget.dart';
import 'package:rizq/features/auth/widgets/media_picking/image_pick_widget.dart';
import 'package:rizq/features/auth/widgets/media_picking/media_constraints_text.dart';
import 'package:rizq/features/auth/widgets/register_progrss_circles/register_progress_circles.dart';
import 'package:rizq/generated/locale_keys.g.dart';


class RegisterSellerAdditionalInfoScreen extends StatelessWidget {
  const RegisterSellerAdditionalInfoScreen({super.key});

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
                child: Column(
                  children: [

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
                      currentPhaseIndex: 2,
                    ),
                    35.vGap,


                    Column(
                      spacing: 10.h,
                      children: [
                        FilePickingWidget(title: LocaleKeys.Auth_register_idImage.tr(context: context), onFileSelected: (f){}),
                        FilePickingWidget(title: LocaleKeys.Auth_register_proveOfOwnership.tr(context: context).tr(context: context), onFileSelected: (f){}),
                      ],
                    ),
                    30.vGap,

                    PrimaryButton(
                      title: LocaleKeys.Auth_Login_signUp.tr(context: context),
                      disabledColor: AppColors.disabledColor,
                      onPressed: (){
                        RouteManager.navigateTo(SuccessfulRegisterScreen());
                      },
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
