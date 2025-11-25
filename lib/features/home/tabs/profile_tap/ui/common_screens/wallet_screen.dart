import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/constant/app_texts.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'wallet_recharge_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        leading: AppBarBackButton(),
        title: Text(
          LocaleKeys.Settings_wallet.tr(context: context),
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.primaryColor,
            size: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [

          Padding(
            padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
            child: _buildWalletCard(context),
          ),
        ],
      ),
    );
  }


  Widget _buildWalletCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.scaffoldCyanColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 20.r,
        children: [
          Row(
            spacing: 12.r,
            children: [
              SvgImage(svgPath: AppAssets.walletIconSvg, width: 24.r, height: 24.r,),
              Text(
                LocaleKeys.Settings_walletBalance.tr(context: context),
                style: AppTextStyles.cairoTextStyle(
                  color: AppColors.primaryColor,
                  size: 14,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Row(
            children: [

              Text(
                LocaleKeys.createAd_distinguishAdPrice.tr(context: context, args: [5000.toString()]),
                style: AppTextStyles.cairoTextStyle(
                  color: AppColors.orangeColor,
                  size: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: ()=>RouteManager.navigateTo(WalletRechargeScreen()),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.r,vertical: 8.r),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(24.r),
                
                  ),
                  child: Text(
                      LocaleKeys.Settings_rechargeWallet.tr(context: context),
                    style: AppTextStyles.cairoTextStyle(
                      size: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              )

            ],
          ),

        ],
      ),
    );
  }
}

