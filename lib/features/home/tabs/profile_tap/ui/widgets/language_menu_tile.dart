import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/lang_helper.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/svg_image.dart';

class AppLanguageDropdown extends StatefulWidget {
  const AppLanguageDropdown({super.key});

  @override
  State<AppLanguageDropdown> createState() => _AppLanguageDropdownState();
}

class _AppLanguageDropdownState extends State<AppLanguageDropdown> {



  void _showLangMenu() async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    final double width = box.size.width;

    final selected = await showMenu(
      context: context,
      color: Colors.white,
      position: RelativeRect.fromDirectional(
        textDirection: context.locale == LangHelper.arabicLocale ? ui.TextDirection.ltr : ui.TextDirection.rtl,
        start: position.dx,
        end: position.dx + width,
        top: position.dy + box.size.height,
        bottom: 0,
        
      ),
      items: [
        LocaleKeys.Languages_arabic,
        LocaleKeys.Languages_english ].map((key)=>PopupMenuItem<String>(
          value: key,
          child: Row(
            spacing: 10.r,
            children: [
              SvgImage(svgPath: key == LocaleKeys.Languages_arabic ? AppAssets.arabicFlagIconSvg : AppAssets.englishFlagIconSvg,
                width: key == LocaleKeys.Languages_arabic ? 21.r : 18.r,
                height: key == LocaleKeys.Languages_arabic ? 21.r : 18.r,
              ),
              Text(
                tr(key, context: context),
                style: AppTextStyles.cairoTextStyle(
                  size: 13,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          )
      )).toList(),

    );

    if (selected != null) {
      print('selected: $selected');
      Locale selectedLocale = selected == LocaleKeys.Languages_english? LangHelper.englishLocale : LangHelper.arabicLocale;
      if((selectedLocale == LangHelper.englishLocale && context.locale == LangHelper.englishLocale )){
        return;
      }
      if((selectedLocale == LangHelper.arabicLocale && context.locale == LangHelper.arabicLocale )){
        return;
      }

      LangHelper.changeAppLanguage(context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showLangMenu,
      child: Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color:  AppColors.overlayColor,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            // LEFT SIDE : title & icon
            SvgImage(
              svgPath: AppAssets.languageIconSvg,
              width: 24.r,
              height: 24.r,
              color: AppColors.primaryColor,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                LocaleKeys.Settings_appLanguage.tr(context: context),
                style: AppTextStyles.cairoTextStyle(
                  color: AppColors.primaryColor,
                  size: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // RIGHT SIDE : selected flag + name + arrow
            Row(
              spacing: 10.r,
              children: [

                SvgImage(
                  svgPath: context.locale == LangHelper.arabicLocale?AppAssets.arabicFlagIconSvg : AppAssets.englishFlagIconSvg ,
                  width: 20.r,),

                Text(
                  tr(context.locale == LangHelper.arabicLocale? LocaleKeys.Languages_arabic : LocaleKeys.Languages_english) ,
                  style: TextStyle(
                    color: Color(0xff003366),
                    fontSize: 14,
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: Color(0xff003366),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
