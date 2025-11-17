import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/cached_net_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/data/category_model.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/screens/ad_images_screen.dart';

class CategoryItem extends StatelessWidget {
final CategoryModel model;
  const CategoryItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: (){
        RouteManager.navigateTo(AdImagesScreen());
      },
      child: Column(
        children: [
          Expanded(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffCCCCCC),
                  width: .5.r,
                ),
                color: Color(0xffF2F2F2),
                shape: BoxShape.circle,
              ),
              child: SizedBox.expand(
                child: CachedNetImage(
                  imageUrl: model.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            model.name,
            style: AppTextStyles.cairoTextStyle(
              size: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          )
        ],
      ),
    ); 
  }
}
