import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/cached_net_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/home/tabs/home_tap/model/adItem.dart';
import 'package:rizq/features/home/tabs/home_tap/model/product_details.dart';
import 'package:rizq/features/home/tabs/home_tap/screens/product_details_screen.dart';

class NewAdCard extends StatelessWidget {
  const NewAdCard({super.key, required this.item,});

  final AdItem item;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () {
        final productDetails = _convertToProductDetails(item);
        RouteManager.navigateTo(ProductDetailsScreen(product: productDetails));
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Color(0xffEBEEF3), width: .5),
          color: AppColors.overlayColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Stack (
                fit: StackFit.expand,
                children: [
                  Positioned.fill(child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                      child: CachedNetImage(imageUrl: 'https://fastly.picsum.photos/id/8/5000/3333.jpg?hmac=OeG5ufhPYQBd6Rx1TAldAuF92lhCzAhKQKttGfawWuA', fit: BoxFit.cover,))),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                      width: 48.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12.r),
                          bottomLeft: Radius.circular(4.r),
                        ),
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          AppAssets.uniceSvg,
                          width: 18.w,
                          height: 18.h,
                          colorFilter: ColorFilter.mode(
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topEnd,
                    child: Container(
                      width: 48.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: AppColors.discountCardColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          bottomRight: Radius.circular(4.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          item.discount,
                          style: AppTextStyles.cairoTextStyle(
                            color: AppColors.sconderyColor,
                            size: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.primaryColor,
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    10.vGap,

                    Row(

                      children: [
                        Text(
                          item.oldPrice,
                          style: AppTextStyles.cairoTextStyle(
                            color: Color(0xffF86317),
                            size: 12,
                            fontWeight: FontWeight.w400,
                          ).copyWith(decoration: TextDecoration.lineThrough),
                        ),
                        8.horizontalSpace,
                        Text(
                          item.price,
                          style: AppTextStyles.cairoTextStyle(
                            color: AppColors.titleColor,
                            size: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ProductDetails _convertToProductDetails(AdItem item) {
    // Convert AdItem to ProductDetails with sample data
    // In a real app, this would come from an API
    return ProductDetails(
      id: item.title.hashCode.toString(),
      title: item.title,
      images: [item.imageAsset, item.imageAsset, item.imageAsset],
      currentPrice: item.price,
      oldPrice: item.oldPrice,
      description:
      'يأتي بشاشة Super Retina XDR بحجم 6.1 بوصة، مع معالج A15 Bionic. نظام كاميرا مزدوجة بدقة 12 ميجابكسل يدعم تقنية 5G لتجربة اتصال أسرع. لون الأسود بطارية 91% ووتر بروف مش مغير اجزاء ضمان شهر مع البوكس.',
      seller: const SellerInfo(
        name: 'محمد محمود',
        role: 'بائع',
        memberSince: '2025-7-25',
        rating: 4.0,
        profileImage: AppAssets.productOnePng, // Using placeholder
      ),
      location: const LocationInfo(
        city: 'دمشق',
        neighborhood: 'الحسينية',
        latitude: 33.5138,
        longitude: 36.2765,
      ),
      specifications: const ProductSpecifications(
        model: '13 برو ماكس',
        brand: 'ايفون',
        color: 'وردي',
        storageCapacity: '128 GB',
        batteryHealth: '91%',
        condition: 'كسر زيرو',
        subCategory: 'هاتف محمول',
        mainCategory: 'الكترونيات',
        neighborhood: 'الحسينية',
        city: 'دمشق',
        accessories: 'كرتونة / شاحن',
      ),
      relatedAds: const [
        RelatedAd(
          title: 'فستان بني قصير',
          image: AppAssets.productOnePng,
          price: '100 ل.س',
          oldPrice: '250 ل.س',
          discount: '-65%',
        ),
        RelatedAd(
          title: 'فستان بني قصير',
          image: AppAssets.productTwoPng,
          price: '100 ل.س',
          oldPrice: '250 ل.س',
          discount: '-65%',
        ),
        RelatedAd(
          title: 'فستان بني قصير',
          image: AppAssets.productOnePng,
          price: '100 ل.س',
          oldPrice: '250 ل.س',
          discount: '-65%',
        ),
        RelatedAd(
          title: 'فستان بني قصير',
          image: AppAssets.productTwoPng,
          price: '100 ل.س',
          oldPrice: '250 ل.س',
          discount: '-65%',
        ),
        RelatedAd(
          title: 'فستان بني قصير',
          image: AppAssets.productOnePng,
          price: '100 ل.س',
          oldPrice: '250 ل.س',
          discount: '-65%',
        ),
        RelatedAd(
          title: 'فستان بني قصير',
          image: AppAssets.productTwoPng,
          price: '100 ل.س',
          oldPrice: '250 ل.س',
          discount: '-65%',
        ),
      ],
    );
  }
}
