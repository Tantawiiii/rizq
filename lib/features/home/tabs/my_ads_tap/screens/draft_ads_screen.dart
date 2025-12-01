import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/features/home/tabs/home_tap/model/adItem.dart';
import 'package:rizq/features/home/tabs/my_ads_tap/widgets/newAdCard.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/router/route_manager.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../widgets/featured_ads_promotional_card.dart';

class DraftsAdsScreen extends StatelessWidget {
  final List<AdItem> ads = [];
  DraftsAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white,

        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: AppColors.primaryColor,
                onPressed: RouteManager.pop,
              ),
              title: Text(
                LocaleKeys.drafts.tr(context: context),
                style: AppTextStyles.cairoTextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  size: 18,
                ),
              ),

            ),
            ads.isEmpty?
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 24.h),
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.noDraftsYet.tr(context: context),
                      textAlign: TextAlign.center,
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.primaryColor,
                        size: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    32.verticalSpace,
                    const FeaturedAdsPromotionalCard(),
                  ],
                ),
              ),
            ):
            SliverPadding(
              padding: EdgeInsetsGeometry.all(AppTheme.defaultEdgePadding),
              sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .7,
                    crossAxisSpacing: AppTheme.defaultEdgePadding,
                    mainAxisSpacing: AppTheme.defaultEdgePadding,

                  ),
                  itemCount: ads.length,
                  itemBuilder: (context,index){
                    return NewAdCard(item: ads[index],);
                  }
              ),
            ),

          ],
        )
    );
  }
}
