import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rizq/core/constant/app_texts.dart';

import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../model/adItem.dart';
import 'ad_card.dart';

class HomeAdsSections extends StatelessWidget {
  const HomeAdsSections({super.key});

  static const _featuredAds = [
    AdItem(
      title: 'أبل ماك بوك إير 15" مع شريحة M2',
      imageAsset: AppAssets.productOnePng,
      price: '100 رس',
      oldPrice: '250 رس',
      discount: '-65%',
    ),
    AdItem(
      title: 'خوذة فيجن تك X1 VR',
      imageAsset: AppAssets.productTwoPng,
      price: '100 رس',
      oldPrice: '250 رس',
      discount: '-65%',
    ),
    AdItem(
      title: 'هاتف Samsung Gala S24 Ultra',
      imageAsset: AppAssets.productOnePng,
      price: '100 رس',
      oldPrice: '250 رس',
      discount: '-65%',
    ),
    AdItem(
      title: 'ساعة آبل ووتش سيريس 9',
      imageAsset: AppAssets.productTwoPng,
      price: '100 رس',
      oldPrice: '250 رس',
      discount: '-65%',
    ),
  ];

  static const _latestAds = [
    AdItem(
      title: 'فستان بني قصير',
      imageAsset: AppAssets.productOnePng,
      price: '100 رس',
      oldPrice: '250 رس',
      discount: '-65%',
    ),
    AdItem(
      title: 'فستان بني قصير',
      imageAsset: AppAssets.productTwoPng,
      price: '100 رس',
      oldPrice: '250 رس',
      discount: '-65%',
    ),
    AdItem(
      title: 'فستان بني قصير',
      imageAsset: AppAssets.productOnePng,
      price: '100 رس',
      oldPrice: '250 رس',
      discount: '-65%',
    ),
    AdItem(
      title: 'فستان بني قصير',
      imageAsset: AppAssets.productTwoPng,
      price: '100 رس',
      oldPrice: '250 رس',
      discount: '-65%',
    ),
  ];

  static const _underFiveThousandAds = [
    AdItem(
      title: 'فستان بني قصير',
      imageAsset: AppAssets.productTwoPng,
      price: '100 رس',
      oldPrice: '250 رس',
      discount: '-65%',
    ),
    AdItem(
      title: 'فستان بني قصير',
      imageAsset: AppAssets.productOnePng,
      price: '100 رس',
      oldPrice: '250 رس',
      discount: '-65%',
    ),
    AdItem(
      title: 'فستان بني قصير',
      imageAsset: AppAssets.productTwoPng,
      price: '100 رس',
      oldPrice: '250 رس',
      discount: '-65%',
    ),
    AdItem(
      title: 'فستان بني قصير',
      imageAsset: AppAssets.productOnePng,
      price: '100 رس',
      oldPrice: '250 رس',
      discount: '-65%',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children:  [
        _AdsSection(
          title: AppTexts.specialAds,
          items: _featuredAds,
        ),
        SizedBox(height: 24),
        _AdsSection(
          title: AppTexts.newestAds,
          items: _latestAds,
        ),
        SizedBox(height: 24),
        _AdsSection(
          title: AppTexts.underFiveThousandAds,
          items: _underFiveThousandAds,
        ),
      ],
    );
  }
}

class _AdsSection extends StatelessWidget {
  const _AdsSection({
    required this.title,
    required this.items,
  });

  final String title;
  final List<AdItem> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.primaryColor,
                size: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            Bounce(
              child: Row(
                children: [
                  Text(
                    AppTexts.seeMore,
                    style: AppTextStyles.cairoTextStyle(
                      color: AppColors.primaryColor,
                      size: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  4.horizontalSpace,
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.w,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          ],
        ),
        16.verticalSpace,
        LayoutBuilder(
          builder: (context, constraints) {
            final double spacing = 16.w;
            final double cardWidth =
                (constraints.maxWidth - spacing) / 2;

            return Wrap(
              spacing: spacing,
              runSpacing: 16.h,
              children: items
                  .map(
                    (item) => SizedBox(
                      width: cardWidth,
                      child: AdCard(item: item),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}
