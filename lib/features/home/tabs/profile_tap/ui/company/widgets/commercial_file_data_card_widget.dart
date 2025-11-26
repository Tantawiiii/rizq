import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/company/widgets/field_item_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class CommercialFileDataCardWidget extends StatelessWidget {
  const CommercialFileDataCardWidget({super.key, this.readOnly = true});

  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FieldItemWidget(
          label: LocaleKeys.Settings_companyName.tr(),
          value: LocaleKeys.Auth_register_shopName.tr(),
          readOnly: readOnly,
          iconSvg: AppAssets.shopIconSvg,
        ),
        12.verticalSpace,
        FieldItemWidget(
          label: LocaleKeys.Settings_typeOfCommercialActivity.tr(),
          value: LocaleKeys.Auth_register_shortCommercialActivity.tr(),
          readOnly: readOnly,
          iconSvg: AppAssets.jobIconSvg,
        ),
        12.verticalSpace,
        FieldItemWidget(
          label: LocaleKeys.Settings_address.tr(),
          value: LocaleKeys.Auth_register_commercialAddress.tr(),
          readOnly: readOnly,
          iconSvg: AppAssets.locationIconSvg,
        ),
        12.verticalSpace,
        FieldItemWidget(
          label: LocaleKeys.Auth_register_addressOnMap.tr(),
          value: LocaleKeys.Auth_register_shortAddressOnMap.tr(),
          readOnly: readOnly,
          iconSvg: AppAssets.linkIconSvg,
        ),
        12.verticalSpace,
        FieldItemWidget(
          label: LocaleKeys.Auth_register_commercialRegistrationNumber.tr(),
          value: LocaleKeys.Auth_register_shortRegistrationNumber.tr(),
          readOnly: readOnly,
          iconSvg: AppAssets.commercialNumberIconSvg,
        ),
        12.verticalSpace,
        FieldItemWidget(
          label: LocaleKeys.Auth_register_websiteLink.tr(),
          value: LocaleKeys.Auth_register_shortWebsiteLink.tr(),
          readOnly: readOnly,
          iconSvg: AppAssets.icWebSiteSvg,
        ),
      ],
    );
  }
}
