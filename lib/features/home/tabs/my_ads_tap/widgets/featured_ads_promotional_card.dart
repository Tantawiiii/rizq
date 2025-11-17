import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_texts.dart';
import '../../../../../core/theme/app_text_styles.dart';

class FeaturedAdsPromotionalCard extends StatelessWidget {
  const FeaturedAdsPromotionalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppTexts.sellWhatYouDontNeed,
            textAlign: TextAlign.center,
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          32.verticalSpace,
          const _DiscountBanner(),
          32.verticalSpace,
          const _BenefitsList(),
          32.verticalSpace,
          PrimaryButton(
            title: AppTexts.subscribeNow,
            backgroundColor: AppColors.primaryColor,
            onPressed: () {

            },
          ),
        ],
      ),
    );
  }
}

class _DiscountBanner extends StatelessWidget {
  const _DiscountBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
        color: const Color(0xffF5F5F5),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 16.h,
            left: 16.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: AppColors.blackTextColor,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                AppTexts.limitedOffer,
                style: AppTextStyles.cairoTextStyle(
                  color: AppColors.white,
                  size: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              AppTexts.discountPercent,
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.blackTextColor,
                size: 48,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          Positioned(
            bottom: 16.h,
            right: 16.w,
            child: Transform.rotate(
              angle: -0.3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.successColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  AppTexts.sitewide,
                  style: AppTextStyles.cairoTextStyle(
                    color: AppColors.white,
                    size: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BenefitsList extends StatelessWidget {
  const _BenefitsList();

  @override
  Widget build(BuildContext context) {
    final benefits = [
      AppTexts.benefitDiscountPackage,
      AppTexts.benefitMoreAdsFaster,
      AppTexts.benefitMoreBuyers,
      AppTexts.benefitBestPrices,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: benefits
          .map(
            (benefit) => Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.rtl,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 6.h, left: 12.w),
                    width: 8.w,
                    height: 8.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      benefit,
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.primaryColor,
                        size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}

