import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/features/home/tabs/my_ads_tap/screens/favorites_ads_screen.dart';

import 'model/ad_stat_item.dart';
import 'screens/active_ads_screen.dart';
import 'screens/featured_ads_screen.dart';
import 'widgets/ad_stat_card.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <AdStatItem>[
      AdStatItem(
        title: 'AppTexts.featuredAds',
        count: 0,
        icon: Icons.verified_outlined,
        onTap: () => RouteManager.navigateTo(const FeaturedAdsScreen()),
      ),
      AdStatItem(
        title:' AppTexts.activeAds',
        count: 1,
        icon: Icons.check_circle_outline,
        onTap: () => RouteManager.navigateTo(const ActiveAdsScreen()),
      ),
      const AdStatItem(
        title: 'AppTexts.drafts',
        count: 0,
        icon: Icons.inbox_outlined,
      ),
      AdStatItem(
        title: 'AppTexts.favoriteAds',
        count: 127,
        icon: Icons.favorite_border,
        onTap: () => RouteManager.navigateTo(const FavoritesAdsScreen()),
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        title: Text('AppTexts.myAds'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _StatsGrid(items: items),
        ),
      ),
    );
  }
}

class _StatsGrid extends StatelessWidget {
  const _StatsGrid({required this.items});
  final List<AdStatItem> items;

  @override
  Widget build(BuildContext context) {
    final spacing = 16.w;
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth - spacing) / 2;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: items
              .map(
                (it) => SizedBox(
                  width: cardWidth,
                  child: AdStatCard(item: it),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
