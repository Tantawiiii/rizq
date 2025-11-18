import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/app_text_field.dart';
import 'package:rizq/core/shared_widgets/custom_dropdown_button.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/utils/lang_helper.dart';
import 'package:rizq/features/auth/widgets/description_text_field.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/add_ad_cubit/add_ad_cubit.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/add_ad_cubit/add_ad_states.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/screens/bouquet_subscription_screen.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class AdInfoWidget extends StatelessWidget {
  const AdInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>sl<AddAdCubit>(),
      child: BlocBuilder<AddAdCubit, AddAdStates>(
          builder: (context,state){
            var cubit = context.read<AddAdCubit>();

            return Container(
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
                    onSaved: (s){},

                    value: cubit.selectedState,
                    onChanged: (s){
                      if(s != null && s.isNotEmpty){
                        cubit.stateChanged(s);
                      }

                    },

                    items: cubit.syriaStatesKeys,
                    validator: (s){
                      if(s == null || s.isEmpty){
                        return 'State is requried';
                      }
                      return null;
                    },
                  ),
                  // city
                  CustomDropdownButton(
                    title: LocaleKeys.createAd_city.tr(context: context),
                    hint: LocaleKeys.createAd_city.tr(context: context),
                    onSaved: (s){},

                    value: cubit.selectedState,
                    onChanged: (s){
                      if(s != null && s.isNotEmpty){
                        cubit.stateChanged(s);
                      }

                    },

                    items: cubit.syriaStatesKeys,
                    validator: (s){
                      if(s == null || s.isEmpty){
                        return 'State is requried';
                      }
                      return null;
                    },
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
                    onSaved: (s){},

                    value: cubit.contactWay,
                    onChanged: (s){},

                    items: cubit.contactWayKeys,
                    validator: (s){
                      if(s == null || s.isEmpty){
                        return 'State is requried';
                      }
                      return null;
                    },
                  ),

                  // price type
                  CustomDropdownButton(
                    title: LocaleKeys.createAd_typeOfPrice.tr(context: context),
                    hint: LocaleKeys.createAd_typeOfPrice.tr(context: context),
                    onSaved: (s){},

                    value: cubit.priceType,
                    onChanged: (s){},

                    items: cubit.priceTypeKeys,
                    validator: (s){
                      if(s == null || s.isEmpty){
                        return 'price type is requried';
                      }
                      return null;
                    },
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
                    title: LocaleKeys.createAd_publishAd.tr(context: context),
                    disabledColor: AppColors.disabledColor,
                    onPressed: (){
                      RouteManager.navigateTo(BouquetSubscriptionScreen());
                    },
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
