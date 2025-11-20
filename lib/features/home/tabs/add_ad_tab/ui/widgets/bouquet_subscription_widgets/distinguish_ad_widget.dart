import 'package:bounce/bounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/data/distinguish_ad_model.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/add_ad_cubit/add_ad_cubit.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/add_ad_cubit/add_ad_states.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class DistinguishAdWidget extends StatelessWidget {
  final DistinguishAdModel distinguishAdModel;
  const DistinguishAdWidget({super.key, required this.distinguishAdModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdCubit, AddAdStates>(
      builder: (context, state) {
        var cubit = context.read<AddAdCubit>();
        return Bounce(
          onTap:(){
            cubit.changedDistinguishAd(distinguishAdModel);
          },
          child: Container(
            padding: EdgeInsets.all(16.r),
            margin: EdgeInsets.symmetric(
              horizontal: AppTheme.defaultEdgePadding,
              vertical: AppTheme.defaultEdgePadding / 2
            ),
            decoration: BoxDecoration(
              color: Color(0xffEEF8FF),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              children: [
                Radio(
                  value: distinguishAdModel,
                  groupValue: cubit.selectedDistinguishAd,
                  onChanged: (DistinguishAdModel? value) {
                    cubit.changedDistinguishAd(value);
                  },
                  fillColor: WidgetStatePropertyAll(AppColors.primaryColor),
                  // side:BorderSide(color: AppColors.primaryColor, width: 1),
                  // innerRadius: WidgetStatePropertyAll(6.r),

                ),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15.r,
                    children: [
                      Text(
                        LocaleKeys.createAd_time_day.plural(
                          distinguishAdModel.noDaysToMarketAd,
                          context: context,
                        ),
                        style: AppTextStyles.cairoTextStyle(
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: AppColors.primaryColor,
                        ),
                      ),

                      Text(
                        LocaleKeys.createAd_adIncreaseFactor.tr(
                          context: context,
                          args: [distinguishAdModel.watchFactor.toString()],
                        ),
                        style: AppTextStyles.cairoTextStyle(
                          fontWeight: FontWeight.w500,
                          size: 12,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 15.r,
                  children: [
                    Text(
                      style: AppTextStyles.cairoTextStyle(
                        fontWeight: FontWeight.w600,
                        size: 14,
                        color: AppColors.primaryColor,
                      ),
                      LocaleKeys.createAd_pricePerDay.tr(
                        context: context,
                        args: [distinguishAdModel.pricePerDay.toString()],
                      ),
                    ),

                    Text(
                      LocaleKeys.createAd_distinguishAdPrice.tr(
                        context: context,
                        args: [
                          (distinguishAdModel.noDaysToMarketAd *
                                  distinguishAdModel.pricePerDay)
                              .toString(),
                        ],
                      ),
                      style: AppTextStyles.cairoTextStyle(
                        fontWeight: FontWeight.w400,
                        size: 12,
                        color: Color(0xffF86317),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
