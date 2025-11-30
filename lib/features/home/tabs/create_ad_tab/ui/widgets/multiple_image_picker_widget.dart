import 'package:bounce/bounce.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class MultipleImagePickerWidget extends StatelessWidget {
  final ValueChanged<List<String>> onImagesSelected;
  const MultipleImagePickerWidget({super.key, required this.onImagesSelected});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: ()async{
        var paths = await pickMultipleImages();
        onImagesSelected(paths);
      },
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: Radius.circular(24.r),
          color: Color(0xffACB9CD),
          dashPattern: [8.8],
          strokeWidth: 1.r,
        ),
        child: Container(
          width: double.infinity,
          height: context.screenHeight / 4,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgImage(svgPath: AppAssets.uploadIconSvg),

              20.vGap,
              Text(
                LocaleKeys.createAd_uploadAdImages.tr(),
                style: AppTextStyles.cairoTextStyle(
                  size: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
              20.vGap,
              Text(
                LocaleKeys.Auth_register_chooseFileFromDevice.tr(context: context),
                style: AppTextStyles.cairoTextStyle(
                  color: AppColors.primaryColor,
                  size: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Future<List<String>> pickMultipleImages() async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.image,
  );

  if (result != null) {
    var paths = <String>[];
    for (var path in result.paths){
      if(path != null && path.isNotEmpty){
        paths.add(path);
      }
    }
    return paths.take(6).toList();
  }
  return <String>[];
}