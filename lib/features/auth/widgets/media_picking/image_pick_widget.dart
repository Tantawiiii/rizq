import 'dart:io';

import 'package:bounce/bounce.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/shared_widgets/cached_net_image.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';

class ImagePickWidget extends StatefulWidget {
  final String? initialImageUrl;
  final void Function(File?) onImagePicked;
  const ImagePickWidget({super.key, this.initialImageUrl,required this.onImagePicked});

  @override
  State<ImagePickWidget> createState() => _ImagePickWidgetState();
}

class _ImagePickWidgetState extends State<ImagePickWidget> {
  File? selectedFile;
  String? initialImgUrl;
  @override
  void initState(){
    super.initState();
    initialImgUrl = widget.initialImageUrl;
  }
  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: pickFile,
      child: Stack(
        children: [
          Container (
            alignment: Alignment.center,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
                color: Colors.white,
                border: selectedFile == null && initialImgUrl == null ? Border.all(
                  width: 1,
                  color: AppColors.borderGrayColor,
                ): null
            ),
            width: 65.r,
            height: 65.r,
            child: initialImgUrl != null ? SizedBox.expand(child: CachedNetImage(imageUrl: initialImgUrl!, fit: BoxFit.cover,)):
            selectedFile != null? SizedBox.expand(child: Image.file(selectedFile!, fit: BoxFit.cover,)):
                SvgImage(svgPath: AppAssets.imagePickerIconSvg ,color: AppColors.fieldHintColor,)
            ,
          ),
          if(selectedFile != null || initialImgUrl != null)
            Positioned.directional(
              bottom: 0,
                textDirection: Directionality.of(context),
                end: 0,
              child: Container(
                width: 24.r,
                height: 24.r,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
                ),
                child: Center(child: Image.asset(AppAssets.editIconPng, width: 16.r, height: 16.r,)),
              ),
            )
        ],
      ),
    );
  }

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', ],
        allowMultiple: false,
      );

      if (result == null || result.files.isEmpty) return;

      setState(() {
        selectedFile = File(result.files.single.path!);
        widget.onImagePicked(selectedFile);
        initialImgUrl = null;
      });
    } catch (e, s) {
      debugPrint('File picker error: $e\n$s');
    }
  }
}
