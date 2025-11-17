import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_texts.dart';

import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../../core/shared_widgets/search_bar_row.dart';
import '../../../../../core/router/route_manager.dart';
import '../screens/category_products_screen.dart';
import 'category_item.dart';

class HomeSearchAndCategories extends StatelessWidget {
  const HomeSearchAndCategories({super.key});

  static const _categoryItems = [
    (title: 'ملابس', asset: AppAssets.clothesCatPng),
    (title: 'إلكترونيات', asset: AppAssets.electronicCatPng),
    (title: 'عقارات', asset: AppAssets.buildingCatPng),
    (title: 'سيارات', asset: AppAssets.carsCatPng),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SearchBarRow(),
        24.verticalSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: Image.asset(
            AppAssets.sliderImgPng,
            fit: BoxFit.cover,
            height: 160.h,
            width: double.infinity,
          ),
        ),
        24.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppTexts.categories,
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.primaryColor,
                size: 20,
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
        24.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _categoryItems
              .map(
                (item) => CategoryItem(
                  title: item.title,
                  assetPath: item.asset,
                  onTap: () => _onCategoryTap(context, item.title),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  void _onCategoryTap(BuildContext context, String category) {
    RouteManager.navigateTo(CategoryProductsScreen(initialCategory: category));
  }
}
