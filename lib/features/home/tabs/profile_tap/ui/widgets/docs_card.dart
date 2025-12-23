import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/widgets/media_picking/file_picking_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/svg_image.dart';

class DocsCard extends StatelessWidget {
  final String initialIdUrl;
  final String? initialOwnershipProveUrl;
  final bool isEditable;
  final void Function(File f)? onIdFileSelected;
  final void Function(File f)? onProveOwnershipFileSelected;

  const DocsCard({
    super.key,
    required this.initialIdUrl,
    required this.initialOwnershipProveUrl,
    this.isEditable = false,
    this.onIdFileSelected,
    this.onProveOwnershipFileSelected
  });

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
        children: isEditable?[
          Text(
            LocaleKeys.Settings_documentation.tr(),
            style: AppTextStyles.cairoTextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
          FilePickingWidget(
              title: LocaleKeys.Auth_register_idImage.tr(),
              onFileSelected: (f){
                if(onIdFileSelected != null){
                  onIdFileSelected!(f!);
                }
              },
            initialImageOrPdfUrl: initialIdUrl,
          ),
          FilePickingWidget(
            title: LocaleKeys.Auth_register_proveOfOwnership.tr(),
            onFileSelected: (f){
              if(onProveOwnershipFileSelected != null){
                onProveOwnershipFileSelected!(f!);
              }
            },
            initialImageOrPdfUrl: initialOwnershipProveUrl,
          ),

        ]

        // if requested by the non-modifiable screen,
            : [

          Text(
            LocaleKeys.Settings_documentation.tr(),
            style: AppTextStyles.cairoTextStyle(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
          DownloadableDocCard(url: initialIdUrl, name: LocaleKeys.Auth_register_idImage.tr()),
          if(initialOwnershipProveUrl != null)
          DownloadableDocCard(url: initialOwnershipProveUrl!, name: LocaleKeys.Auth_register_proveOfOwnership.tr()),

        ],
      ),
    );
  }
}

class DownloadableDocCard extends StatelessWidget {
  final String url;
  final String name;
  const DownloadableDocCard({super.key, required this.url, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        spacing: 12.r,
        children: [
          SvgImage(
            svgPath: url.isImage
                ? AppAssets.imageIconSvg
                : AppAssets.pdfIconSvg,
            width: 20.r,
            height: 20.r,
            color: AppColors.fieldHintColor,
          ),
          Text(
            name,
            style: AppTextStyles.cairoTextStyle(
              size: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: (){
              // TODO: DOWNLOAD THIS RESOURCE
            },
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.transparent),
            ),
            icon: SvgImage(svgPath: AppAssets.downloadIconSvg, width: 20.r,height: 20.r, color: AppColors.blackTextColor,),
          ),
        ],
      ),
    );
  }
}
