import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class SocialMediaCard extends StatelessWidget {
  final String? facebookLink;
  final String? whatsAppLink;
  final String? instagramLink;
  final String? linkedinLink;

  const SocialMediaCard({super.key, required this.facebookLink, required this.whatsAppLink, required this.instagramLink, required this.linkedinLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
      decoration: BoxDecoration(
        color: AppColors.scaffoldCyanColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15.r,
        children: [

          Text(
            LocaleKeys.Settings_socialMedia.tr(context: context),
            style: AppTextStyles.cairoTextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
          if(facebookLink == null && whatsAppLink == null && instagramLink == null && linkedinLink == null)
            Text(
              LocaleKeys.Settings_noSocialAccountsFound.tr(context: context),
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.greyTextColor
              ),
            ),
          Row(
            spacing: 15.r,
            children: [
              if(facebookLink != null)
              Expanded(
                child: SocialContainer(svgPath: AppAssets.facebookNotFilledIconSvg, name: LocaleKeys.Settings_facebook.tr()),
              ),
              if(whatsAppLink != null)
                Expanded(
                  child: SocialContainer(svgPath: AppAssets.whatsAppIconSvg, name: LocaleKeys.Settings_whatsapp.tr()),
                ),

            ],
          ),
          Row(
            spacing: 15.r,
            children: [
              if(instagramLink != null)
                Expanded(
                  child: SocialContainer(svgPath: AppAssets.instagramIconSvg, name: LocaleKeys.Settings_instagram.tr()),
                ),
              if(linkedinLink != null)
                Expanded(
                  child: SocialContainer(svgPath: AppAssets.linkedinIconSvg, name: LocaleKeys.Settings_linkedin.tr()),
                ),

            ],
          ),

        ],
      ),
    );

  }
}
class SocialContainer extends StatelessWidget {
  final String svgPath;
  final String name;
  const SocialContainer({super.key, required this.svgPath, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        spacing: 15.r,
        children: [
          SvgImage(svgPath: svgPath, width: 20.r, height: 20.r, color: AppColors.fieldHintColor,),
          Text(
            name,
            style: AppTextStyles.cairoTextStyle(
              size: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          )
        ],
      ),
    );
  }
}

