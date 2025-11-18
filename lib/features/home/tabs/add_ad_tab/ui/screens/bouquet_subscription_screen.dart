import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/add_ad_cubit/add_ad_cubit.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/add_ad_cubit/add_ad_states.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/widgets/bouquet_subscription_widgets/distinguish_ads_tab.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/widgets/bouquet_subscription_widgets/sliding_button.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/widgets/bouquet_subscription_widgets/subscription_bouquets_tab.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class BouquetSubscriptionScreen extends StatelessWidget {
  const BouquetSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddAdCubit>(
      create: (context)=>sl<AddAdCubit>(),
      child: BlocBuilder<AddAdCubit,AddAdStates>(
          builder: (context,state){
            print('in bouquets screen, rebuild');
            var cubit = context.read<AddAdCubit>();
            return Scaffold(
              body: SafeArea(
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [


                    if(AddAdCubit.isTopSliverShown)
                    SliverAppBar(
                      pinned: false,
                      floating: false,
                      expandedHeight: 140 .h,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.r),
                          color: Colors.white,
                          child: Column(
                            spacing: 8.r,
                            children: [
                              12.vGap,
                              Row(
                                spacing: 10.r,
                                children: [
                                  IconButton(onPressed: (){
                                    cubit.toggleSliverBarVisibility(false);
                                  }, icon: Icon(Icons.highlight_remove_outlined, color: AppColors.primaryColor,)),
                                  Text(
                                    LocaleKeys.createAd_wannaIncreaseAdMonthlyNo.tr(context: context),
                                    style: AppTextStyles.cairoTextStyle(
                                      size: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primaryColor,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Text(
                                LocaleKeys.createAd_subscribeInBouquetTitle.tr(context: context),
                                style: AppTextStyles.cairoTextStyle(
                                  size: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.titleColor,
                                ),
                                textAlign: TextAlign.center,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      centerTitle: true,
                      title: SlidingButton() ,
                      pinned: true,
                    ),

                    cubit.adAction == AdAction.subscribeInBouquet
                        ? SubscriptionBouquetsTab()
                        : DistinguishAdsTab()


                  ],
                ),
              ),
            );
          }),
    );
  }
}

