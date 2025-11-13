import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constant/app_assets.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../model/adItem.dart';

class AdCard extends StatelessWidget {
  const AdCard({super.key, required this.item});

  final AdItem item;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28.r),
          border: Border.all(color: AppColors.textFieldBorderColor),
          color: AppColors.overlayColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withOpacity(0.08),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 170.h,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26.r),
                      topRight: Radius.circular(26.r),
                    ),
                    child: Image.asset(item.imageAsset, fit: BoxFit.cover),
                  ),
                  Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Container(
                      width: 48.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(26.r),
                          bottomRight: Radius.circular(20.r),
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
                          topRight: Radius.circular(26.r),
                          bottomLeft: Radius.circular(20.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          item.discount,
                          style: AppTextStyles.poppinsTextStyle(
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
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28.r),
                  bottomRight: Radius.circular(28.r),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.poppinsTextStyle(
                      color: AppColors.primaryColor,
                      size: 12.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  12.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.oldPrice,
                        style: AppTextStyles.poppinsTextStyle(
                          color: AppColors.sconderyColor,
                          size: 12.sp,
                          fontWeight: FontWeight.w800,
                        ).copyWith(decoration: TextDecoration.lineThrough),
                      ),
                      8.horizontalSpace,
                      Text(
                        item.price,
                        style: AppTextStyles.poppinsTextStyle(
                          color: AppColors.greyTextColor,
                          size: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
