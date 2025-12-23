import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/features/home/tabs/profile_tap/data/models/subscription_model.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/shared_widgets/primary_button.dart';

class SubscriptionsScreen extends StatelessWidget {
  final SubscriptionModel? subscriptionModel;
  const SubscriptionsScreen({super.key, this.subscriptionModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: Text(
          LocaleKeys.Settings_subscriptions.tr(context: context),
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.primaryColor,
            size: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // if user hasn't subscribed yet
            if(subscriptionModel == null)
              Container(
                padding: EdgeInsets.all(16.r),
                margin: EdgeInsets.all(16.r) ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.scaffoldCyanColor
                ),
                child: Column(
                  spacing: 20.r,
                  children: [
                    Text(
                      'أنت الآن علي النسخة المجانية وقمت بنشر 1/3 من الإعلانات',
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    PrimaryButton(
                      title: LocaleKeys.Settings_subscribeNow.tr(context: context),
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
            if(subscriptionModel != null)
              SubscriptionDetailsWidget(subscriptionModel: subscriptionModel!)

          ],
        ),
      ),
    );
  }
}

class SubscriptionDetailsWidget extends StatelessWidget {
  final SubscriptionModel subscriptionModel;
  const SubscriptionDetailsWidget({super.key, required this.subscriptionModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.r,
      children: [
        Container(
          padding: EdgeInsets.all(16.r),
          margin: EdgeInsets.all(16.r) ,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.scaffoldCyanColor
          ),
          child: Column(
            spacing: 20.r,
            children: [
              Text(
                LocaleKeys.Settings_youAreOnThisBouquetAndConsumed_N_Of_M_Adds.tr(context: context,
                args: [
                  subscriptionModel.bouquetName,
                  subscriptionModel.usedAds.toString(),
                  subscriptionModel.totalAds.toString(),

                ]
                ),
                style: AppTextStyles.cairoTextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              PrimaryButton(
                title: LocaleKeys.Settings_upgradeBouquet.tr(),
                onPressed: (){},
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(16.r),
          margin: EdgeInsets.symmetric(horizontal: 16.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: AppColors.scaffoldCyanColor
          ),
          child: Column(
            spacing: 20.r,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    subscriptionModel.bouquetName,
                    style: AppTextStyles.cairoTextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.primaryColor
                    ),
                  ),

                  StatusContainer(status: LocaleKeys.Settings_active.tr())

                ],
              ),

              Wrap(
                alignment: WrapAlignment.start,
                spacing: 25.r,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.start,
                runSpacing: 25.r,
                direction: Axis.horizontal,
                children: [
                  AdDetailsColumn(
                   title: LocaleKeys.Settings_totalMonthAds.tr(context: context),
                    body: LocaleKeys.Settings_ad.plural(subscriptionModel.totalAds, context: context,args: [subscriptionModel.totalAds.toString()]),
                  ),
                  AdDetailsColumn(
                    title: LocaleKeys.Settings_totalUsedAds.tr(context: context),
                    body: LocaleKeys.Settings_ad.plural(subscriptionModel.usedAds, context: context,args: [subscriptionModel.usedAds.toString()]),
                  ),

                ],
              )
            ],
          ),
        ),

      ],
    );
  }
}


class StatusContainer extends StatelessWidget {
  final String status;
  const StatusContainer({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 4.r),
      decoration: BoxDecoration(
        color: Color(0xffD1FADF),
        borderRadius: BorderRadius.circular(24.r)
      ),
      child: Text(
        status,
        style: AppTextStyles.cairoTextStyle(
          color: Color(0xff079455),
          size: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class AdDetailsColumn extends StatelessWidget {
  final String title;
  final String body;
  const AdDetailsColumn({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.r,
      children: [
        Text(
          title,
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.titleColor,
            size: 14
          ),
        ),
        Text(
          body,
          style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 14,
            fontWeight: FontWeight.w500,
          ),
        ),

      ],
    );
  }
}
