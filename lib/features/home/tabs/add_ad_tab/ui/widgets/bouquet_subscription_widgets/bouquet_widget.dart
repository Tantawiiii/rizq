import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/data/bouquet_model.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class BouquetWidget extends StatelessWidget {
  final BouquetModel bouquet;
  const BouquetWidget({super.key, required this.bouquet});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
      decoration: BoxDecoration(
        color: Color(0xffEEF8FF),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bouquet.bouquetName,
            style: AppTextStyles.cairoTextStyle(
              fontWeight: FontWeight.w600,
              size: 18,
              color: AppColors.primaryColor,
            ),
          ),
          15.vGap,

          // bouquet price
          Text.rich(
            TextSpan(
              text: LocaleKeys.createAd_distinguishAdPrice.tr(
                context: context,
                args: [bouquet.bouquetPrice.toString()],
              ),
              style: AppTextStyles.cairoTextStyle(
                color: Color(0xffF86317),
                size: 20,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: '/',
                  style: AppTextStyles.cairoTextStyle(
                    color: Color(0xffF86317),
                    size: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: LocaleKeys.createAd_time_month.plural(
                    1,
                    context: context,
                    args: ['1'],
                  ),
                  style: AppTextStyles.cairoTextStyle(
                    color: Color(0xffF86317),
                    size: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: Colors.orangeAccent),

          Text(
            '${LocaleKeys.createAd_adsPerMonth.tr(context: context, args: [bouquet.noAdds.toString()])} ${LocaleKeys.createAd_time_month.plural(1, context: context, args: ['1'])}',

            style: AppTextStyles.cairoTextStyle(
              size: 14,
              color: AppColors.titleColor,
            ),
          ),
          10.vGap,
          Text(
            '${LocaleKeys.createAd_distinguishableAdsPerMonth.tr(context: context, args: [bouquet.noDistinguishableAds.toString()])} ${LocaleKeys.createAd_time_month.plural(1, context: context, args: ['1'])}',

            style: AppTextStyles.cairoTextStyle(
              size: 14,
              color: AppColors.titleColor,
            ),
          ),
          10.vGap,
          Text(
            '${LocaleKeys.createAd_marketAdFor.tr(context: context, args: [bouquet.noDaysToMarketAd.toString()])} ${LocaleKeys.createAd_time_month.plural(1, context: context, args: ['1'])}',

            style: AppTextStyles.cairoTextStyle(
              size: 14,
              color: AppColors.titleColor,
            ),
          ),
          10.vGap,

          PrimaryButton(
            title: LocaleKeys.createAd_subscribeInThisBouquet.tr(
              context: context,
            ),
            onPressed: () {
              //RouteManager.navigateTo(PaymentScreen());
            },
          ),
        ],
      ),
    );
  }
}
