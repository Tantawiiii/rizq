import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
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
import 'package:rizq/features/auth/register/seller/logic/seller_register_cubit.dart';
import 'package:rizq/features/auth/register/seller/logic/seller_register_states.dart';
import 'package:rizq/features/auth/register/seller/ui/screens/seller_additional_info.dart';
import 'package:rizq/features/auth/widgets/auth_custom_scaffold.dart';
import 'package:rizq/features/auth/widgets/description_text_field.dart';
import 'package:rizq/features/auth/widgets/form_validators.dart';
import 'package:rizq/features/auth/widgets/media_picking/image_pick_widget.dart';
import 'package:rizq/features/auth/widgets/media_picking/media_constraints_text.dart';
import 'package:rizq/features/auth/widgets/register_progrss_circles/register_progress_circles.dart';
import 'package:rizq/generated/locale_keys.g.dart';


class RegisterSellerCommercialInfoScreen extends StatelessWidget {
   RegisterSellerCommercialInfoScreen({super.key});

   final shopNameController = TextEditingController(text: kDebugMode? "Rizq Store": "");
   final commercialAddressController = TextEditingController(text: kDebugMode? "Alexandria-Nozha": "");
   final addressLinkController = TextEditingController(text: kDebugMode? "https://www.google.maps/422-566": "");
   final registrationNoController = TextEditingController(text: kDebugMode? "42566": "");
   final webSiteLinkController = TextEditingController(text: kDebugMode? "https://www.rar-it.com": "");
   final descriptionController = TextEditingController(text: kDebugMode? "Short Description for Rizq Store": "");

   final formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: formKey,
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
                        currentPhaseIndex: 1,
                      ),
                      35.vGap,
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          LocaleKeys.Auth_register_sellerLogo.tr(),
                          style: AppTextStyles.poppinsTextStyle(
                            size: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.fieldTitleColor,
                          ),
                        ),
                      ),
                      15.vGap,
                      //TODO: IMAGE PICKER
                      Row(
                        spacing: 20.r,
                        children: [
                          ImagePickWidget(),
                          Expanded(
                            child: MediaConstraintsText(
                                title: LocaleKeys.Auth_register_logoRqs.tr(context: context),
                                constraints: [
                                  LocaleKeys.Auth_register_logoSizeReqs.tr(),
                                  LocaleKeys.Auth_register_logoCapacityReqs.tr(),
                                ]
                            ),
                          ),
                        ],
                      ),
                      20.vGap,


                      Column(
                        spacing: 10.h,
                        children: [

                          AppTextField(
                            controller: shopNameController,
                            validator: FormValidators.nameValidator,
                            hint: LocaleKeys.Auth_register_shopName.tr(),
                            title:  LocaleKeys.Auth_register_shopName.tr(),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            prefixIcon: SvgImage(svgPath: AppAssets.shopIconSvg, color: AppColors.fieldHintColor,),

                          ),

                          CustomDropdownButton(
                            title: LocaleKeys.Auth_register_commercialActivityType.tr(context: context),
                            hint:  LocaleKeys.Auth_register_shortCommercialActivity.tr(context: context),
                            onSaved: (s){},

                            value: cubit.selectedCommercialActivity,
                            onChanged: (s){
                              if(s != null && s.isNotEmpty){
                                cubit.commercialActivityChanged(s);
                              }

                            },
                            prefixIcon: SvgImage(svgPath: AppAssets.jobIconSvg,  color: AppColors.fieldHintColor, ),
                            items: cubit.commercialActivityKeys,
                            validator: (s){
                              if(s == null || s.isEmpty){
                                return LocaleKeys.formErrors_commercialActivityRequired.tr(context: context);
                              }
                              return null;
                            },
                          ),


                          AppTextField(
                            controller: commercialAddressController,
                            validator: FormValidators.commercialActivityAddressValidator,
                            hint: LocaleKeys.Auth_register_commercialAddress.tr(),
                            title: LocaleKeys.Auth_register_commercialAddress.tr(),
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next,
                            prefixIcon: SvgImage(svgPath: AppAssets.locationIconSvg, color: AppColors.fieldHintColor,),
                          ),

                          AppTextField(
                            controller: addressLinkController,
                            hint: LocaleKeys.Auth_register_shortAddressOnMap.tr(),
                            title: LocaleKeys.Auth_register_addressOnMap.tr(),
                            keyboardType: TextInputType.streetAddress,
                            textInputAction: TextInputAction.next,
                            prefixIcon: SvgImage(svgPath: AppAssets.linkIconSvg, color: AppColors.fieldHintColor,),
                          ),

                          AppTextField(
                            controller: registrationNoController,
                            hint: LocaleKeys.Auth_register_shortRegistrationNumber.tr(),
                            title: LocaleKeys.Auth_register_commercialRegistrationNumber.tr(),
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            prefixIcon: SvgImage(svgPath: AppAssets.commercialNumberIconSvg, color: AppColors.fieldHintColor,),
                          ),

                          AppTextField(
                            controller: webSiteLinkController,
                            hint: LocaleKeys.Auth_register_shortWebsiteLink.tr(),
                            title: LocaleKeys.Auth_register_websiteLink.tr(),
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.next,
                            prefixIcon: SvgImage(svgPath: AppAssets.linkIconSvg, color: AppColors.fieldHintColor,),
                          ),


                          DescriptionTextField(
                            controller: descriptionController,
                            title: LocaleKeys.Auth_register_activityDescription.tr(context: context),
                            hint: LocaleKeys.Auth_register_shortActivityDescription.tr(context: context),
                            textInputAction: TextInputAction.done,
                          )
                        ],
                      ),
                      30.vGap,

                      PrimaryButton(
                        title: LocaleKeys.Auth_next.tr(context: context),
                        disabledColor: AppColors.disabledColor,
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            RouteManager.navigateTo(RegisterSellerAdditionalInfoScreen());
                          }
                        },
                      ),
                      25.vGap,

                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
