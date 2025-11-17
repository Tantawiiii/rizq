import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_texts.dart';
import '../../../../../core/router/route_manager.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../widgets/featured_ads_promotional_card.dart';

class FeaturedAdsScreen extends StatelessWidget {
  const FeaturedAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldCyanColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: AppColors.primaryColor,
            onPressed: RouteManager.pop,
          ),
          title: Text(
            AppTexts.featuredAds,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
            child: Column(
              children: [
                Text(
                  AppTexts.noFeaturedAdsYet,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.poppinsTextStyle(
                    color: AppColors.primaryColor,
                    size: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                32.verticalSpace,
                Expanded(
                  child: SingleChildScrollView(
                    child: const FeaturedAdsPromotionalCard(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
