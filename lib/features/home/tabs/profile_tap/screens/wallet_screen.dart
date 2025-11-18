import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_texts.dart';
import '../../../../../core/router/route_manager.dart';
import '../../../../../core/shared_widgets/primary_button.dart';
import '../../../../../core/theme/app_text_styles.dart';
import 'wallet_recharge_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: _buildWalletCard(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.of(context).maybePop(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20.w,
              color: AppColors.primaryColor,
            ),
          ),
          Expanded(
            child: Text(
              AppTexts.wallet,
              textAlign: TextAlign.center,
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.primaryColor,
                size: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_right,
              size: 20.w,
              color: AppColors.primaryColor,
            ),
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
        children: [
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                size: 32.w,
                color: AppColors.primaryColor,
              ),
              16.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppTexts.walletBalance,
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.primaryColor,
                        size: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    8.verticalSpace,
                    Text(
                      '5000 ل.س',
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.sconderyColor,
                        size: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          PrimaryButton(
            title: AppTexts.rechargeWallet,
            backgroundColor: AppColors.primaryColor,
            onPressed: () {
              RouteManager.navigateTo(const WalletRechargeScreen());
            },
          ),
        ],
      ),
    );
  }
}

