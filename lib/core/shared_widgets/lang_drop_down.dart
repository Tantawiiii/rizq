import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/core/utils/lang_helper.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class LangDropDown extends StatefulWidget {

  const LangDropDown({super.key});

  @override
  State<LangDropDown> createState() => _LangDropDownState();
}

class _LangDropDownState extends State<LangDropDown> {

  @override
  void didChangeDependencies(){
    selectedValue = LangHelper.getLanguageKeyFromCode(context: context,);
    super.didChangeDependencies();
  }

  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth/3,
      child: DropdownButtonFormField2<String>(
        items:[
          LocaleKeys.Languages_arabic,
          LocaleKeys.Languages_english ].map((key)=>DropdownMenuItem<String>(

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
        onChanged: (key){
          setState(() {
            selectedValue = key;
          });
          if(context.locale.languageCode == LangHelper.arabicCode && key != LocaleKeys.Languages_arabic){
            context.setLocale(LangHelper.englishLocale);
          }
          if(context.locale.languageCode == LangHelper.englishCode && key != LocaleKeys.Languages_english){
            context.setLocale(LangHelper.arabicLocale);
          }
        },

        //isExpanded: true,
        value: selectedValue,


        menuItemStyleData: MenuItemStyleData(
          overlayColor: WidgetStatePropertyAll(AppColors.disabledColor),
        ),
        isDense: true,
          iconStyleData: IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down, color: AppColors.primaryColor,)
          ),
        buttonStyleData: ButtonStyleData(
          width: context.screenWidth/3,
        ),

        dropdownStyleData: DropdownStyleData(
            isOverButton: false,
            width: context.screenWidth / 3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            )
        ),

        selectedItemBuilder: (context) {
          return [
            LocaleKeys.Languages_arabic,
            LocaleKeys.Languages_english ].map((key) => Text(
            tr(key, context: context),
            style: AppTextStyles.cairoTextStyle(
              size: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          )).toList();
        },

          decoration: InputDecoration(

            hintStyle: AppTextStyles.cairoTextStyle(
              size: 13,
              color: AppColors.fieldHintColor,
            ),
            filled: true,
            prefixIcon:  SvgImage(svgPath: selectedValue == LocaleKeys.Languages_arabic ? AppAssets.arabicFlagIconSvg : AppAssets.englishFlagIconSvg,
              width:  18.r,
              height: 18.r,
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 18.r,
              maxWidth: 18.r,
            ),
            fillColor: Colors.transparent,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,

          )

      ),
    );
  }
}
