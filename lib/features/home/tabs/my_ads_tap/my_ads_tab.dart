import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/features/home/tabs/my_ads_tap/screens/draft_ads_screen.dart';
import 'package:rizq/features/home/tabs/my_ads_tap/screens/favorites_ads_screen.dart';
import 'package:rizq/generated/locale_keys.g.dart';

import 'screens/active_ads_screen.dart';
import 'screens/featured_ads_screen.dart';
import 'widgets/ad_stat_card.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        title: Text(
          LocaleKeys.myAds.tr(context: context),
          style: AppTextStyles.cairoTextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
            size: 18,
          ),
        ),
      ),
      body: GridView(
        padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: AppTheme.defaultEdgePadding,
          crossAxisSpacing: AppTheme.defaultEdgePadding,
        ),

        physics: BouncingScrollPhysics(),
        children: [
          AdStatCard(
            name: LocaleKeys.activeAds.tr(),
            svgPath: AppAssets.checkIconSvg,
            number: 10,
            onPressed: () => RouteManager.navigateTo(const ActiveAdsScreen()),
          ),
          AdStatCard(
            name: LocaleKeys.featuredAds.tr(),
            svgPath: AppAssets.badgeIconSvg,
            number: 10,
            onPressed: () => RouteManager.navigateTo(FeaturedAdsScreen()),
          ),
          AdStatCard(
            name: LocaleKeys.drafts.tr(),
            svgPath: AppAssets.draftIconSvg,
            number: 10,
            onPressed: () =>RouteManager.navigateTo(DraftsAdsScreen()),
          ),
          AdStatCard(
            name: LocaleKeys.favoriteAds.tr(),
            svgPath: AppAssets.favIconSvg,
            number: 10,
            onPressed: () =>
                RouteManager.navigateTo(const FavoritesAdsScreen()),
          ),
        ],
      ),
    );
  }
}
