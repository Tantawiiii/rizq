import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_texts.dart';
import '../../../../../core/router/route_manager.dart';
import '../../../../../core/shared_widgets/search_bar_row.dart';
import '../../home_tap/model/adItem.dart';
import '../../home_tap/widgets/ad_card.dart';
import '../../home_tap/widgets/filter_drawer.dart';

class FavoritesAdsScreen extends StatelessWidget {
  const FavoritesAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.whiteBackground,
        endDrawer: const FilterDrawer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            color: Colors.transparent,
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                    color: AppColors.primaryColor,
                    onPressed: RouteManager.pop,
                  ),
                  Expanded(
                    child: Text(
                      AppTexts.favoriteAds,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 48.w),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: const SearchBarRow(),
              ),
              Expanded(child: _buildAdsGrid()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdsGrid() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final spacing = 16.w;
        final cardWidth = (constraints.maxWidth - spacing * 3) / 2;

        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          children: [
            Wrap(
              spacing: spacing,
              runSpacing: spacing,
              children: _mockAds
                  .map(
                    (ad) => SizedBox(
                      width: cardWidth,
                      child: AdCard(item: ad),
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }

  static final List<AdItem> _mockAds = [
    const AdItem(
      title: 'فستان بني قصير',
      imageAsset: AppAssets.productOnePng,
      price: '100 ل.س',
      oldPrice: '250\$',
      discount: '-65%',
    ),
    const AdItem(
      title: 'فستان بني قصير',
      imageAsset: AppAssets.productTwoPng,
      price: '100 ل.س',
      oldPrice: '250\$',
      discount: '-65%',
    ),
    const AdItem(
      title: 'فستان بني قصير',
      imageAsset: AppAssets.productOnePng,
      price: '100 ل.س',
      oldPrice: '250\$',
      discount: '-65%',
    ),
    const AdItem(
      title: 'فستان بني قصير',
      imageAsset: AppAssets.productTwoPng,
      price: '100 ل.س',
      oldPrice: '250\$',
      discount: '-65%',
    ),
    const AdItem(
      title: 'فستان بني قصير',
      imageAsset: AppAssets.productOnePng,
      price: '100 ل.س',
      oldPrice: '250\$',
      discount: '-65%',
    ),
    const AdItem(
      title: 'فستان بني قصير',
      imageAsset: AppAssets.productTwoPng,
      price: '100 ل.س',
      oldPrice: '250\$',
      discount: '-65%',
    ),
  ];
}
