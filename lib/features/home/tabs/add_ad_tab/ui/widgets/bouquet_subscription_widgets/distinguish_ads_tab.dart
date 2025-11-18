import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/data/distinguish_ad_model.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/widgets/bouquet_subscription_widgets/distinguish_ad_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class DistinguishAdsTab extends StatelessWidget {
  const DistinguishAdsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        ...List.generate(
          8,
          (index) => DistinguishAdWidget(
            distinguishAdModel: DistinguishAdModel(index + 1, 100, index + 3),
          ),
        ).animate().slideX(duration: Duration(milliseconds: 400)),

        Padding(
          padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
          child: Row(
            spacing: 20.r,
            children: [

              Expanded(
                child: PrimaryButton(
                  title: LocaleKeys.Auth_next.tr(context: context),
                  disabledColor: AppColors.disabledColor,
                  onPressed: () {
                    //RouteManager.navigateTo(PaymentScreen);
                  },
                ),
              ),

              Expanded(
                child: PrimaryButton(
                  onPressed: () {},
                  title: LocaleKeys.createAd_skip.tr(context: context),
                  backgroundColor: Color(0xffDCF1FF),
                  textStyle: AppTextStyles.cairoTextStyle(
                    fontWeight: FontWeight.w500,
                    size: 16,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
