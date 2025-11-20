import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rizq/core/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/register/data/models/category_model.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/widgets/category_item.dart';
import 'package:rizq/generated/locale_keys.g.dart';
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              leading: const AppBarBackButton(),
              title: Text(LocaleKeys.createAd_addNewAd.tr(context: context)),
              pinned: false,
              floating: true,
            ),

            SliverAppBar(
              title: Text(LocaleKeys.createAd_chooseCategory.tr(context: context)),
              pinned: true,
              floating: false,
            ),

        
            // Grid inside CustomScrollView
            SliverPadding(
              padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppTheme.defaultEdgePadding,
                  mainAxisSpacing: AppTheme.defaultEdgePadding,
                  childAspectRatio: .8,
                ),
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return CategoryItem(
                      model: CategoryModel(
                        id: 1,
                        name: 'الكترونيات',
                        imageUrl:
                        'https://fastly.picsum.photos/id/48/5000/3333.jpg?hmac=y3_1VDNbhii0vM_FN6wxMlvK27vFefflbUSH06z98so',
                      ),
                    );
                  },
                  childCount: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
