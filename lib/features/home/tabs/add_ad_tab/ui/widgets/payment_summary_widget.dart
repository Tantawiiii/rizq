import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/data/payment_summary_model.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/payment_cubit/payment_cubit.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/payment_cubit/payment_states.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/screens/successful_published_ad_screen.dart';
import 'package:rizq/generated/locale_keys.g.dart';

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

class PaymentWidget extends StatelessWidget {
  final String svgImagePath;
  final PaymentMethod paymentMethod;
  const PaymentWidget({super.key, required this.svgImagePath, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentCubit,PaymentStates>(
      builder: (context,state) {
        var cubit = context.read<PaymentCubit>();
        return Row(
          children: [
            Radio<PaymentMethod>(
              value: paymentMethod,
              groupValue: cubit.selectedPaymentMethod,
              onChanged: (PaymentMethod? value) {
                if(value != null){
                  cubit.changePaymentMethod(value);
                }
              },
              fillColor: WidgetStatePropertyAll(AppColors.primaryColor),
              side:BorderSide(color: AppColors.primaryColor, width: 1),
              innerRadius: WidgetStatePropertyAll(6.r),
            ),
            SvgImage(svgPath: svgImagePath, width: 48.r, height: 36.r,),
          ],
        );
      }
    );
  }
}
