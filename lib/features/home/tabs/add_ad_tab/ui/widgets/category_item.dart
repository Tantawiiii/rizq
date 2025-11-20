import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/cached_net_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/features/auth/register/data/models/category_model.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/screens/ad_images_screen.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/screens/ad_info_screen.dart';

class CategoryItem extends StatelessWidget {
final CategoryModel model;
  const CategoryItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: (){
        RouteManager.navigateTo(AdInfoScreen());
      },
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Color(0xffEEF8FF),
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1, color: Color(0xffEBEEF3))
        ),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox.expand(
                child: CachedNetImage(
                  imageUrl: model.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  model.name,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.cairoTextStyle(
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ); 
  }
}
