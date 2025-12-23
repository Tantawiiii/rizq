import 'package:bounce/bounce.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/widgets/description_text_field.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/seller/update_shop_info_screen.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/widgets/docs_card.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/widgets/social_media_card.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/shared_widgets/app_text_field.dart';
import 'package:rizq/shared_widgets/svg_image.dart';

class ShopInfoScreen extends StatelessWidget {
  const ShopInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: AppBarBackButton(),
          actionsPadding: EdgeInsets.symmetric(horizontal: 12.r),
          actions: [
            Bounce(
              onTap: ()=>RouteManager.navigateTo(UpdateShopInfoScreen()),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Text(
                  LocaleKeys.Settings_modify.tr(),
                  style: AppTextStyles.cairoTextStyle(
                    color: Colors.white,
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
          title: Text(
            LocaleKeys.Settings_shopInfo.tr(context: context),
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
            padding: EdgeInsets.symmetric(horizontal: AppTheme.defaultEdgePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15.r,
              children: [
                15.vGap,
                Row(
                  children: [
                    CircleAvatar(
                      radius: 28.w,
                      backgroundImage: const AssetImage('assets/pngs/rizq_logo.png'),
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'RaR Store',
                            style: AppTextStyles.cairoTextStyle(
                              color: AppColors.primaryColor,
                              size: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          4.verticalSpace,
                          Text(
                            'example@gmail.com',
                            style: AppTextStyles.cairoTextStyle(
                              color: AppColors.greyTextColor,
                              size: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
                5.vGap,
                Text(
                  LocaleKeys.Settings_shopInfoData.tr(context: context),
                  style: AppTextStyles.cairoTextStyle(
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
                5.vGap,

                AppTextField(
                  hint: LocaleKeys.Auth_register_shopName.tr(),
                  title:  LocaleKeys.Auth_register_shopName.tr(),
                  prefixIcon: SvgImage(svgPath: AppAssets.shopIconSvg, color: AppColors.fieldHintColor,),
                  isEnabled: false,
                ),

                AppTextField(
                  title: LocaleKeys.Auth_register_commercialActivityType.tr(context: context),
                  hint:  LocaleKeys.Auth_register_shortCommercialActivity.tr(context: context),
                  prefixIcon: SvgImage(svgPath: AppAssets.jobIconSvg,  color: AppColors.fieldHintColor, ),
                  isEnabled: false,
                ),



                AppTextField(
                  hint: LocaleKeys.Auth_register_commercialAddress.tr(),
                  title: LocaleKeys.Auth_register_commercialAddress.tr(),
                  prefixIcon: SvgImage(svgPath: AppAssets.locationIconSvg, color: AppColors.fieldHintColor,),
                  isEnabled: false,
                ),

                AppTextField(
                  hint: LocaleKeys.Auth_register_shortAddressOnMap.tr(),
                  title: LocaleKeys.Auth_register_addressOnMap.tr(),
                  prefixIcon: SvgImage(svgPath: AppAssets.linkIconSvg, color: AppColors.fieldHintColor,),
                  isEnabled: false,
                ),

                AppTextField(
                  hint: LocaleKeys.Auth_register_shortRegistrationNumber.tr(),
                  title: LocaleKeys.Auth_register_commercialRegistrationNumber.tr(),
                  prefixIcon: SvgImage(svgPath: AppAssets.commercialNumberIconSvg, color: AppColors.fieldHintColor,),
                  isEnabled: false,
                ),

                AppTextField(
                  hint: LocaleKeys.Auth_register_shortWebsiteLink.tr(),
                  title: LocaleKeys.Auth_register_websiteLink.tr(),
                  prefixIcon: SvgImage(svgPath: AppAssets.linkIconSvg, color: AppColors.fieldHintColor,),
                  isEnabled: false,
                ),



                DescriptionTextField(
                  title: LocaleKeys.Auth_register_activityDescription.tr(context: context),
                  hint: LocaleKeys.Auth_register_shortActivityDescription.tr(context: context),
                  textInputAction: TextInputAction.done,
                  isEnabled: false,
                ),
                DocsCard(
                    initialIdUrl: 'https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI',
                    initialOwnershipProveUrl: 'https://fastly.picsum.photos/id/866/200/300.jpg?hmac=rcadCENKh4rD6MAp6V_ma-AyWv641M4iiOpe1RyFHeI'
                ),

                SocialMediaCard(facebookLink: '', whatsAppLink: '', instagramLink: '', linkedinLink: ''),
              ],
            ),
          ),
        )
    );
  }
}

