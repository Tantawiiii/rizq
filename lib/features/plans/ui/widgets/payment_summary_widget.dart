import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/features/home/tabs/create_ad_tab/ui/screens/successful_published_ad_screen.dart';
import 'package:rizq/features/plans/data/models/payment_summary_model.dart';
import 'package:rizq/features/plans/ui/widgets/payment_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/primary_button.dart';

class PaymentSummaryWidget extends StatelessWidget {
  final PaymentSummaryModel paymentSummaryModel;

  const PaymentSummaryWidget({super.key, required this.paymentSummaryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      margin:  EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Color(0xffEEF8FF),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        spacing: 16.r,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.createAd_paymentMethod.tr(context: context),
            style: AppTextStyles.cairoTextStyle(
              size: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PaymentWidget(svgImagePath: AppAssets.paypalIconSvg, paymentMethod: PaymentMethod.paypal,),
              PaymentWidget(svgImagePath: AppAssets.stripeIconSvg, paymentMethod: PaymentMethod.stripe),
              PaymentWidget(svgImagePath: AppAssets.mastercardIconSvg, paymentMethod: PaymentMethod.masterCard),
            ],
          ),

          // details: like total price and fee
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              spacing: 15.r,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.createAd_paymentSummary.tr(context: context),
                  style: AppTextStyles.cairoTextStyle(
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
                // price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.createAd_bouquetPrice.tr(context: context, args: [paymentSummaryModel.whatHeBought]),
                      style: AppTextStyles.cairoTextStyle(
                        size: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.titleColor,
                      ),
                    ),
                    Text(
                      LocaleKeys.createAd_distinguishAdPrice.tr(context: context, args: [paymentSummaryModel.price.toString()]),
                      style: AppTextStyles.cairoTextStyle(
                        size: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.orangeColor,
                      ),
                    ),
                  ],
                ),
                //service fee
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.createAd_serviceMargin.tr(context: context,),
                      style: AppTextStyles.cairoTextStyle(
                        size: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.titleColor,
                      ),
                    ),
                    Text(
                      LocaleKeys.createAd_distinguishAdPrice.tr(context: context, args: [paymentSummaryModel.serviceFee.toString()]),
                      style: AppTextStyles.cairoTextStyle(
                        size: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.orangeColor,
                      ),
                    ),
                  ],
                ),

                Divider(
                  color: AppColors.fieldHintColor,
                ),
                //total

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocaleKeys.createAd_totalPrice.tr(context: context,),
                      style: AppTextStyles.cairoTextStyle(
                        size: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.titleColor,
                      ),
                    ),
                    Text(
                      LocaleKeys.createAd_distinguishAdPrice.tr(context: context, args: [(paymentSummaryModel.serviceFee + paymentSummaryModel.price).toString()]),
                      style: AppTextStyles.cairoTextStyle(
                        size: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.orangeColor,
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
          
          PrimaryButton(
            title: LocaleKeys.createAd_confirmPayment.tr(context: context),
            onPressed: (){
              RouteManager.navigateTo(SuccessfulPublishedAdScreen());
            },
          ),
          
        ],
      )

    );
  }
}

