import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/widgets/media_picking/file_picking_widget.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/screens/ad_info_screen.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class AdImagesScreen extends StatelessWidget {
  const AdImagesScreen({super.key});

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
                LocaleKeys.createAd_addingAdImages.tr(context: context),
              ),
              pinned: true,
              floating: false,
              bottom: PreferredSize(
                preferredSize: Size(double.maxFinite, 20),
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: AppTheme.defaultEdgePadding,
                    ),
                    child: Text(
                      LocaleKeys.createAd_addTo6Images.tr(context: context),
                      style: AppTextStyles.cairoTextStyle(
                        size: 12,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
                child: Column(
                  children: [
                    // GRID as a normal GridView
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: AppTheme.defaultEdgePadding,
                        mainAxisSpacing: AppTheme.defaultEdgePadding,
                      ),
                      itemBuilder: (context, index) {
                        return FilePickingWidget(
                          title:
                          '${LocaleKeys.createAd_image.tr(context: context)} ${index + 1}',
                          isForAd: true,
                          onFileSelected: (f) {},
                        );
                      },
                    ),
                    20.vGap,
                    LinearProgressIndicator(value: .3, backgroundColor: Color(0xffEBEEF3), valueColor: AlwaysStoppedAnimation(Color(0xff00A2FF)),),
                    20.vGap,
                    PrimaryButton(
                      title: LocaleKeys.Auth_next.tr(context: context),
                      disabledColor: AppColors.disabledColor,
                      onPressed: (){
                        RouteManager.navigateTo(AdInfoScreen());
                      },
                    ),

                    35.vGap,
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
