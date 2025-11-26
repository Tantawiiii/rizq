import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/enums/enums.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/core/shared_widgets/dialogs/logout_dialog.dart';
import 'package:rizq/core/shared_widgets/dialogs/show_dialog_method.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/features/home/tabs/profile_tap/data/models/subscription_model.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/common_screens/personal_info_screen.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/common_screens/saved_alerts_screen.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/common_screens/subscriptions_screen.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/common_screens/wallet_screen.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/company/branches_company_screen.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/company/company_info_screen.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/seller/shop_info_screen.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/widgets/custom_switch.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/widgets/forward_icon.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/widgets/language_menu_tile.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/widgets/profile_menu_card.dart';
import 'package:rizq/features/notifications/ui/screens/notifications_screen.dart';
import 'package:rizq/generated/locale_keys.g.dart';


class CompanyProfileTab extends StatelessWidget {
  const CompanyProfileTab({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          leading: AppBarBackButton(),
          title: Text(
            LocaleKeys.Settings_profile.tr(context: context),
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 18.sp,
              fontWeight: FontWeight.w600,
            ),

          ),
        ),
        backgroundColor: AppColors.whiteBackground,
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.fromLTRB(
                AppTheme.defaultEdgePadding,
                AppTheme.defaultEdgePadding,
                AppTheme.defaultEdgePadding,
                130.r
            ),
            child: Column(
                spacing: 20.h,
                children: [

                  //personal info
                  ProfileMenuCard(
                    title: LocaleKeys.Settings_profileInfo.tr(context: context),
                    leadingSvgPath: AppAssets.userIconSvg,
                    trailing: ForwardIcon(),
                    onTap: () => RouteManager.navigateTo(const PersonalInfoScreen()),
                  ),


                    ProfileMenuCard(
                      title: LocaleKeys.Settings_companyInfo.tr(context: context),
                      leadingSvgPath: AppAssets.shopInfoIconSvg,
                      trailing: ForwardIcon(),
                      onTap: () =>RouteManager.navigateTo(CompanyInfoScreen()),
                    ),

                    ProfileMenuCard(
                      title: LocaleKeys.Settings_branchesAndWorkingHours.tr(context: context),
                      leadingSvgPath: AppAssets.companyIconSvg,
                      trailing: ForwardIcon(),
                      onTap: ()=>RouteManager.navigateTo(BranchesCompanyScreen()),
                    ),

                  //wallet screen
                  ProfileMenuCard(
                    title: LocaleKeys.Settings_wallet.tr(context: context),
                    leadingSvgPath: AppAssets.walletIconSvg,
                    trailing: ForwardIcon(),
                    onTap: () => RouteManager.navigateTo(const WalletScreen()),
                  ),

                  //subscriptions screen
                  ProfileMenuCard(
                    title: LocaleKeys.Settings_subscriptions.tr(),
                    leadingSvgPath: AppAssets.subscriptionsIconSvg,
                    trailing: ForwardIcon(),
                    onTap: ()=>RouteManager.navigateTo(SubscriptionsScreen(subscriptionModel: SubscriptionModel(bouquetName: 'الباقة المميزة', totalAds: 30, usedAds: 5),)),
                  ),

                  // saved alerts screen
                  ProfileMenuCard(
                    title: LocaleKeys.Settings_savedAlerts.tr(),
                    leadingSvgPath: AppAssets.savedAlertsIconSvg,
                    trailing: ForwardIcon(),
                    onTap: ()=>RouteManager.navigateTo(SavedAlertsScreen()),
                  ),


                  AppLanguageDropdown(),

                  // notifications
                  ProfileMenuCard(
                    title: LocaleKeys.Settings_notifications.tr(),
                    leadingSvgPath: AppAssets.notificationIconSvg,
                    trailing: CustomSwitch(initialValue: true, onChanged: (v){}),
                    onTap: () =>RouteManager.navigateTo(NotificationsScreen()),
                  ),

                  //logout
                  ProfileMenuCard(
                    title: LocaleKeys.Settings_logout.tr(),
                    leadingSvgPath: AppAssets.logoutIconSvg,
                    trailing: ForwardIcon(),
                    isForLogout: true,
                    onTap: () {
                      showCustomDialog(dialog: LogoutDialog(), context: context);
                    },
                  ),


                ]

            ),
          ),
        )
    );
  }

}
