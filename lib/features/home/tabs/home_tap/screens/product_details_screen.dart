import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_texts.dart';
import '../../../../../core/router/route_manager.dart';
import '../../../../../core/shared_widgets/primary_button.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../model/adItem.dart';
import '../model/product_details.dart';
import '../widgets/ad_card.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductDetails product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _selectedImageIndex = 0;
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImageGallery(),
            16.verticalSpace,
            _buildPriceSection(),
            20.verticalSpace,
            _buildActionButtons(),
            24.verticalSpace,
            _buildGeneralTipsSection(),
            24.verticalSpace,
            _buildSellerSection(),
            24.verticalSpace,
            _buildLocationSection(),
            24.verticalSpace,
            _buildDescriptionSection(),
            24.verticalSpace,
            _buildSpecificationsTable(),
            24.verticalSpace,
            _buildRelatedAdsSection(),
            24.verticalSpace,
            _buildMoreButton(),
            24.verticalSpace,
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () => RouteManager.pop(),
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: AppColors.primaryColor,
          size: 20.w,
        ),
      ),
      centerTitle: true,
      title: Text(
        widget.product.title,
        style: AppTextStyles.cairoTextStyle(
          color: AppColors.primaryColor,
          size: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildImageGallery() {
    return Column(
      children: [
        SizedBox(
          height: 350.h,
          width: double.infinity,
          child: PageView.builder(
            itemCount: widget.product.images.length,
            onPageChanged: (index) {
              setState(() {
                _selectedImageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.asset(
                widget.product.images[index],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
        if (widget.product.images.length > 1) ...[
          12.verticalSpace,
          SizedBox(
            height: 80.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: widget.product.images.length,
              itemBuilder: (context, index) {
                final isSelected = index == _selectedImageIndex;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedImageIndex = index;
                    });
                  },
                  child: Container(
                    width: 80.w,
                    height: 80.h,
                    margin: EdgeInsetsDirectional.only(end: 12.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primaryColor
                            : AppColors.textFieldBorderColor,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(11.r),
                      child: Image.asset(
                        widget.product.images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPriceSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Flexible(
            child: Text(
              widget.product.currentPrice,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.primaryColor,
                size: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          12.horizontalSpace,
          Flexible(
            child: Text(
              widget.product.oldPrice,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.sconderyColor,
                size: 16,
                fontWeight: FontWeight.w600,
              ).copyWith(decoration: TextDecoration.lineThrough),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          PrimaryButton(
            title: AppTexts.contactSeller,
            textStyle: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 14,
              fontWeight: FontWeight.w600,
            ),
            backgroundColor: AppColors.scaffoldCyanColor,
            icon: SvgPicture.asset(
              _isFavorite ? AppAssets.heartSvg : AppAssets.heartSlashSvg,
              width: 20.w,
              height: 20.h,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            iconLeading: true,
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
            },
          ),
          12.verticalSpace,
          GestureDetector(
            onTap: () {
            },
            child: Text(
              AppTexts.notifyWhenPriceDrops,
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.primaryColor,
                size: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGeneralTipsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.generalTips,
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          16.verticalSpace,
          ...AppTexts.generalTipsList.map(
            (tip) => Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(end: 12.w, top: 6.h),
                    width: 6.w,
                    height: 6.h,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      tip,
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.greyTextColor,
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSellerSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.sellerInfo,
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          16.verticalSpace,
          Row(
            children: [
              CircleAvatar(
                radius: 30.r,
                backgroundImage: AssetImage(widget.product.seller.profileImage),
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.seller.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.primaryColor,
                        size: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      widget.product.seller.role,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.greyTextColor,
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      '${AppTexts.memberSince} ${widget.product.seller.memberSince}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.greyTextColor,
                        size: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              8.horizontalSpace,
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(end: 2.w),
                    child: Icon(
                      Icons.star,
                      size: 18.w,
                      color: index < widget.product.seller.rating.toInt()
                          ? Colors.amber
                          : AppColors.textFieldBorderColor,
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.locationOnMap,
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          12.verticalSpace,
          Text(
            '${widget.product.location.city} - ${widget.product.location.neighborhood}',
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.greyTextColor,
              size: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          12.verticalSpace,
          Container(
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.textFieldBorderColor),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Container(
                color: AppColors.overlayColor,
                child: Center(
                  child: Icon(
                    Icons.map,
                    size: 48.w,
                    color: AppColors.primaryColor.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.productDescription,
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          12.verticalSpace,
          Text(
            widget.product.description,
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.greyTextColor,
              size: 14,
              fontWeight: FontWeight.w400,
            ).copyWith(height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecificationsTable() {
    final specs = widget.product.specifications;
    final items = [
      _SpecItem(AppTexts.model, specs.model),
      _SpecItem(AppTexts.brand, specs.brand),
      _SpecItem(AppTexts.color, specs.color),
      _SpecItem(AppTexts.storageCapacity, specs.storageCapacity),
      _SpecItem(AppTexts.batteryHealth, specs.batteryHealth),
      _SpecItem(AppTexts.condition, specs.condition),
      _SpecItem(AppTexts.subCategory, specs.subCategory),
      _SpecItem(AppTexts.mainCategory, specs.mainCategory),
      _SpecItem(AppTexts.neighborhood, specs.neighborhood),
      _SpecItem(AppTexts.city, specs.city),
      _SpecItem(AppTexts.accessories, specs.accessories),
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.information,
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          16.verticalSpace,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.textFieldBorderColor),
            ),
            child: Column(
              children: items.map((item) {
                final isLast = items.last == item;
                return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    border: isLast
                        ? null
                        : Border(
                            bottom: BorderSide(
                              color: AppColors.textFieldBorderColor,
                              width: 1,
                            ),
                          ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          item.value,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: AppTextStyles.cairoTextStyle(
                            color: AppColors.primaryColor,
                            size: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      8.horizontalSpace,
                      Flexible(
                        child: Text(
                          item.label,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.start,
                          style: AppTextStyles.cairoTextStyle(
                            color: AppColors.greyTextColor,
                            size: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedAdsSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.relatedAds,
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          16.verticalSpace,
          LayoutBuilder(
            builder: (context, constraints) {
              final spacing = 12.w;
              final cardWidth = (constraints.maxWidth - spacing) / 2;
              return Wrap(
                spacing: spacing,
                runSpacing: 12.h,
                children: widget.product.relatedAds
                    .map(
                      (relatedAd) => SizedBox(
                        width: cardWidth,
                        child: AdCard(
                          item: AdItem(
                            title: relatedAd.title,
                            imageAsset: relatedAd.image,
                            price: relatedAd.price,
                            oldPrice: relatedAd.oldPrice,
                            discount: relatedAd.discount,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMoreButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: PrimaryButton(
        title: AppTexts.seeMore,
        backgroundColor: AppColors.primaryColor,
        onPressed: () {},
      ),
    );
  }
}

class _SpecItem {
  const _SpecItem(this.label, this.value);

  final String label;
  final String value;
}
