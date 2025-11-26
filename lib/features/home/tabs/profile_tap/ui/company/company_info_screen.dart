import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/company/widgets/commercial_file_data_card_widget.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/company/widgets/company_header_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class CompanyInfoScreen extends StatefulWidget {
  const CompanyInfoScreen({super.key});

  @override
  State<CompanyInfoScreen> createState() => _CompanyInfoScreenState();
}

class _CompanyInfoScreenState extends State<CompanyInfoScreen> {
  bool _isEditingCommercialData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            CompanyHeaderWidget(
              title: LocaleKeys.Settings_companyInfo.tr(),
              actionText: _isEditingCommercialData
                  ? 'حفظ'
                  : LocaleKeys.Settings_modify.tr(),
              onModifyPressed: () {
                setState(() {
                  _isEditingCommercialData = !_isEditingCommercialData;
                });
              },
            ),
            16.verticalSpace,
            _CompanyInfoCard(),
            12.verticalSpace,
            Text(
              LocaleKeys.Settings_commercialFileData.tr(),
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.primaryColor,
                size: 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            12.verticalSpace,
            CommercialFileDataCardWidget(readOnly: !_isEditingCommercialData),
            12.verticalSpace,
            _DocumentationCard(),
            12.verticalSpace,
            _SocialMediaCard(),
          ],
        ),
      ),
    );
  }
}

class _CompanyInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            shape: BoxShape.circle,
          ),
        ),
        16.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.Settings_companyName.tr(),
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.primaryColor,
                size: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            10.verticalSpace,
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'WWW.store.com',
                  style: AppTextStyles.cairoTextStyle(
                    color: AppColors.primaryColor,
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ).copyWith(decoration: TextDecoration.underline),
                ),
                6.horizontalSpace,
                Icon(Icons.edit, size: 16.w, color: AppColors.primaryColor),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _DocumentationCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.overlayColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.Settings_documentation.tr(),
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          16.verticalSpace,
          _DocumentItem(title: LocaleKeys.Settings_taxCard.tr(), onTap: () {}),
          12.verticalSpace,
          _DocumentItem(
            title: LocaleKeys.Settings_professionalLicense.tr(),
            onTap: () {},
          ),
          12.verticalSpace,
          _DocumentItem(
            title: LocaleKeys.Settings_commercialRegister.tr(),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _DocumentItem extends StatelessWidget {
  const _DocumentItem({required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppAssets.pdfIconSvg,
              width: 24.w,
              height: 24.w,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            12.horizontalSpace,
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.cairoTextStyle(
                  color: AppColors.primaryColor,
                  size: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SvgPicture.asset(AppAssets.icDownloadSvg),
          ],
        ),
      ),
    );
  }
}

class _SocialMediaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.overlayColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.Settings_socialMedia.tr(),
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          16.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _SocialMediaButton(
                  title: LocaleKeys.Settings_whatsapp.tr(),
                  icon: AppAssets.whatsAppIconSvg,
                  onTap: () {},
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: _SocialMediaButton(
                  title: LocaleKeys.Settings_telegram.tr(),
                  icon: AppAssets.icTelegramSvg,
                  isMaterialIcon: false,
                  onTap: () {},
                ),
              ),
            ],
          ),
          12.verticalSpace,
          Row(
            children: [
              Expanded(
                child: _SocialMediaButton(
                  title: LocaleKeys.Settings_facebook.tr(),
                  icon: AppAssets.facebookLogoSvg,
                  onTap: () {},
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: _SocialMediaButton(
                  title: LocaleKeys.Settings_instagram.tr(),
                  icon: AppAssets.instagramIconSvg,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SocialMediaButton extends StatelessWidget {
  const _SocialMediaButton({
    required this.title,
    required this.onTap,
    this.icon,
    this.isMaterialIcon = false,
  });

  final String title;
  final VoidCallback onTap;
  final dynamic icon;
  final bool isMaterialIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isMaterialIcon && icon is IconData)
              Icon(icon as IconData, size: 24.w, color: AppColors.primaryColor)
            else if (icon is String)
              SvgPicture.asset(
                icon as String,
                width: 24.w,
                height: 24.w,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            14.horizontalSpace,
            Text(
              title,
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.primaryColor,
                size: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
