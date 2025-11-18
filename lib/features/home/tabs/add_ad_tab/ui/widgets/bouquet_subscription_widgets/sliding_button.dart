import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/add_ad_cubit/add_ad_cubit.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/add_ad_cubit/add_ad_states.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class SlidingButton extends StatelessWidget {
  const SlidingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAdCubit, AddAdStates>(
      builder: (context, state) {
        var cubit  = context.read<AddAdCubit>();

        return CupertinoSlidingSegmentedControl<AdAction>(

          onValueChanged: (AdAction? action) {
            if(action != null){
              print('called');
              cubit.changeAdAction(action);
            }
          },
          backgroundColor: Color(0xffDCF1FF),
          groupValue: cubit.adAction,
          thumbColor: AppColors.primaryColor,
          children: {
            AdAction.subscribeInBouquet: Container(
              height: 40,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                LocaleKeys.createAd_subscribeInBouquet.tr(context: context),
                style: cubit.adAction == AdAction.subscribeInBouquet ? cubit.adAction.selectedTextStyle : cubit.adAction.unSelectedTextStyle,
              ),
            ),
            AdAction.distinguishAd: Text(
              LocaleKeys.createAd_distinguishAd.tr(context: context),
              style: cubit.adAction == AdAction.distinguishAd ? cubit.adAction.selectedTextStyle : cubit.adAction.unSelectedTextStyle,

            ),
          },
        );
      },
    );
  }
}

enum AdAction { subscribeInBouquet, distinguishAd;

 TextStyle get selectedTextStyle=>AppTextStyles.cairoTextStyle(
  size: 14,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);
 TextStyle get unSelectedTextStyle=>AppTextStyles.cairoTextStyle(
   size: 14,
   fontWeight: FontWeight.w500,
   color: AppColors.titleColor,
 );

}
