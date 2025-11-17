import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/widgets/ad_info_widget.dart';
import 'package:rizq/features/home/tabs/home_tap/model/adItem.dart';
import 'package:rizq/features/home/tabs/home_tap/widgets/ad_card.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class AdInfoScreen extends StatelessWidget {
  const AdInfoScreen({super.key});

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
              automaticallyImplyLeading: false,
              title: Text(
                LocaleKeys.createAd_adInfo.tr(context: context),
              ),
              pinned: true,
              floating: false,
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
                child: Column(
                  children: [

                    AdInfoWidget(),
                    20.vGap,
                  ],
                ),
              ),
            )

            // Grid inside CustomScrollView
            // SliverPadding(
            //   padding: EdgeInsets.all(
            //     AppTheme.defaultEdgePadding,),
            //   sliver: SliverGrid(
            //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //       crossAxisCount: 2,
            //       crossAxisSpacing: AppTheme.defaultEdgePadding,
            //       mainAxisSpacing: AppTheme.defaultEdgePadding,
            //     ),
            //     delegate: SliverChildBuilderDelegate((context, index) {
            //       return FilePickingWidget(
            //         title:
            //             '${LocaleKeys.createAd_image.tr(context: context)} ${index + 1}',
            //         isForAd: true,
            //         onFileSelected: (f) {},
            //       );
            //     }, childCount: 6),
            //   ),
            // ),
            //
          ],
        ),
      ),
    );
  }
}
