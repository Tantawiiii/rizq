import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/features/auth/widgets/description_text_field.dart';
import 'package:rizq/features/auth/widgets/form_validators.dart';
import 'package:rizq/features/home/tabs/create_ad_tab/logic/create_ad_cubit/create_ad_cubit.dart';
import 'package:rizq/features/home/tabs/create_ad_tab/logic/create_ad_cubit/create_ad_states.dart';
import 'package:rizq/features/home/tabs/create_ad_tab/ui/screens/ad_images_screen.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/app_text_field.dart';
import 'package:rizq/shared_widgets/custom_dropdown_button.dart';
import 'package:rizq/shared_widgets/custom_error_widget.dart';
import 'package:rizq/shared_widgets/custom_skelton.dart';
import 'package:rizq/shared_widgets/primary_button.dart';

class AdInfoWidget extends StatelessWidget {
  const AdInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAdCubit, CreateAdStates>(
        builder: (context,state){
          var cubit = context.read<CreateAdCubit>();


          return state is CreateAdGetDataFailureState? CustomErrorWidget(errorMessage: state.errorMessage, onRefresh: (){
            cubit.getGovernorates();
          }):  CustomSkelton(
            enabled: state is CreateAdGettingDataState,
            child: Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.scaffoldCyanColor,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xff19213D14),
                        spreadRadius: 0,
                        blurRadius: 4,
                        offset: Offset(0, 1)
                    )
                  ]

              ),
              child: Column(
                spacing: 15.r,
                children: [
                  AppTextField(
                    title: LocaleKeys.createAd_adTitle.tr(context: context),
                    hint: LocaleKeys.createAd_adTitle.tr(context: context),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  ),

                  // state
                  CustomDropdownButton(
                    title: LocaleKeys.Auth_state.tr(context: context),
                    hint: LocaleKeys.Auth_state.tr(context: context),

                    value: cubit.selectedGov,
                    onChanged: (s){
                      if(s != null && s.isNotEmpty){
                        cubit.selectedGov = s;;
                      }

                    },
                    items: List.generate(cubit.governorates.length, (i)=>cubit.governorates[i].name.getNameInCurrentLocale(context)),
                    validator: FormValidators.stateValidator,
                  ),
                  // city
                  CustomDropdownButton(
                    title: LocaleKeys.createAd_city.tr(context: context),
                    hint: LocaleKeys.createAd_city.tr(context: context),

                    value: cubit.selectedGov,
                    onChanged: (s){
                      if(s != null && s.isNotEmpty){
                        cubit.selectedGov = s;;
                      }
                    },
                    items: List.generate(cubit.governorates.length, (i)=>cubit.governorates[i].name.getNameInCurrentLocale(context)),
                    validator: FormValidators.stateValidator,
                  ),

                  AppTextField(
                    title: LocaleKeys.createAd_price.tr(context: context),
                    hint: LocaleKeys.createAd_price.tr(context: context),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                  ),
                  //contact way
                  CustomDropdownButton(
                    title: LocaleKeys.createAd_contactWay.tr(context: context),
                    hint: LocaleKeys.createAd_contactWay.tr(context: context),
                    value: cubit.contactWay,
                    onChanged: (s){
                      if(s != null && s.isNotEmpty){
                        cubit.contactWay = s;;
                      }
                    },
                    items: cubit.contactWayKeys,
                    validator: FormValidators.contactWayValidator
                  ),

                  // price type
                  CustomDropdownButton(
                    title: LocaleKeys.createAd_typeOfPrice.tr(context: context),
                    hint: LocaleKeys.createAd_typeOfPrice.tr(context: context),

                    value: cubit.priceType,
                    onChanged: (s){
                      if(s != null && s.isNotEmpty){
                        cubit.priceType = s;
                      }
                    },

                    items: cubit.priceTypeKeys,
                    validator: FormValidators.priceTypeValidator,
                  ),

                  AppTextField(
                    title: LocaleKeys.createAd_contactNumber.tr(context: context),
                    hint: LocaleKeys.createAd_contactNumber.tr(context: context),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.phone,
                  ),

                  DescriptionTextField(
                    textInputAction: TextInputAction.done,
                    title: LocaleKeys.createAd_adDescription.tr(context: context),
                    hint: LocaleKeys.Auth_register_shortActivityDescription.tr(context: context),
                  ),

                  PrimaryButton(
                    title: LocaleKeys.Auth_next.tr(context: context),
                    disabledColor: AppColors.disabledColor,
                    onPressed: (){
                      RouteManager.navigateTo(BlocProvider.value(
                          value: context.read<CreateAdCubit>(),
                          child: AdImagesScreen()));
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
