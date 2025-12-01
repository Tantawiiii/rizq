import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/home/tabs/my_ads_tap/widgets/newAdCard.dart';
import 'package:rizq/generated/locale_keys.g.dart';

import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/router/route_manager.dart';
import '../../../../../core/shared_widgets/search_bar_row.dart';
import '../../home_tap/model/adItem.dart';
import '../../home_tap/widgets/ad_card.dart';
import '../../home_tap/widgets/filter_drawer.dart';

class ActiveAdsScreen extends StatelessWidget {
  const ActiveAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      endDrawer: const FilterDrawer(),

      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              actions: [
                //to hide end drawer icon
                SizedBox.shrink(),
              ],
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: AppColors.primaryColor,
                onPressed: RouteManager.pop,
              ),
              title: Text(
                LocaleKeys.activeAds.tr(),
                style: AppTextStyles.cairoTextStyle(
                  size: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              pinned: false,
              floating: true,
            ),
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              actions: [SizedBox.shrink()],
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:  AppTheme.defaultEdgePadding),
                  child: SearchBarRow(),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.all(AppTheme.defaultEdgePadding),
              sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .7,
                    crossAxisSpacing: AppTheme.defaultEdgePadding,
                    mainAxisSpacing: AppTheme.defaultEdgePadding,
                      
                  ),
                  itemCount: _mockAds.length,
                  itemBuilder: (context,index){
                    return NewAdCard(item: _mockAds[index],);
                  }
              ),
            )
          ],
        ),
      )

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
