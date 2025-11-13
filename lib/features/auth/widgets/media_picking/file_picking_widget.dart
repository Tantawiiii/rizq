import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdfx/pdfx.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/shared_widgets/cached_net_image.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class FilePickingWidget extends StatefulWidget {
  final String title;
  final void Function(File? file) onFileSelected;
  final String? initialImageOrPdfUrl;

  const FilePickingWidget({super.key, required this.title, required this.onFileSelected, this.initialImageOrPdfUrl});

  @override
  State<FilePickingWidget> createState() => _FilePickingWidgetState();
}

class _FilePickingWidgetState extends State<FilePickingWidget> {

  File? pickedFile;
  late String? initialUrl;
  @override
  void initState(){
    super.initState();
    initialUrl = widget.initialImageOrPdfUrl;
  }

  @override
  Widget build(BuildContext context) {
    widget.onFileSelected(pickedFile);
    return Container(
      decoration: BoxDecoration(

        border: Border.all(
          width: 1.r,
          color: AppColors.borderGrayColor,
        ),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24.r),
      ),
      width: double.infinity,
      height: context.screenHeight / 4,
        child: Stack(
          children: [
            if(pickedFile == null && initialUrl == null)
              buildChooseFileWidget(),

            if(pickedFile != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(23.r),
                child: pickedFileWidget(),
              ),
            // TODO: SHOW IMAGE FROM LINK OR PDF FIRST PAGE IMAGE
            if(initialUrl != null)
              SizedBox.expand(child: initialImageWidget()),

            if(pickedFile != null || initialUrl != null)
              Positioned(
                top: 8.r,
                right: 8.r,
                width: 40.r,
                height: 40.r,
                child: IconButton(
                    style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Color(0xffF0F8FF)),
                        padding: WidgetStatePropertyAll(EdgeInsets.zero),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r)))
                    ),
                    onPressed: (){
                      setState(() {
                        pickedFile = null;
                        initialUrl = null;
                      });
                    }, icon: Icon(Icons.delete, color: Colors.black,)
                ),
              ),
          ],
        ),

    );
  }
  Widget buildChooseFileWidget(){
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: ()async{
        print('pressed');
        await pickFile();
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 12.r, horizontal: 8.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: SizedBox.expand(child: SvgImage(svgPath: AppAssets.uploadIconSvg,))),
            SizedBox(width: double.infinity,),
            25.vGap,
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Text(
                    widget.title,
                    style: AppTextStyles.poppinsTextStyle(
                      color: AppColors.primaryColor,
                      size: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.vGap,
                  Text(
                    LocaleKeys.Auth_register_chooseFileFromDevice.tr(context: context),
                    style: AppTextStyles.poppinsTextStyle(
                      color: AppColors.primaryColor,
                      size: 12,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf',],
        allowMultiple: false,
      );

      if (result == null || result.files.isEmpty) return;
      File selectedFile = File(result.files.single.path!);

      setState(() {
        pickedFile = selectedFile;
        initialUrl = null;
      });
    } catch (e, s) {
      debugPrint('File picker error: $e\n$s');
    }
  }

  Widget pickedFileWidget(){
    if(pickedFile == null) return SizedBox.shrink();

    if(pickedFile!.path.isImage){
      return Image.file(File(pickedFile!.path), width: double.infinity, height: context.screenHeight/4,fit: BoxFit.cover,);
    }

    else if (pickedFile!.path.isPDF) {
      return FutureBuilder<Uint8List?>(
        future: _generatePdfThumbnailFromLocalFile(pickedFile!.path),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              width: double.infinity,
              height: context.screenHeight/4,
              alignment: Alignment.center,
              color: Colors.grey.shade100,
              child: const CircularProgressIndicator(),
            );
          }
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.memory(snapshot.data!, fit: BoxFit.cover),
              const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.picture_as_pdf, color: Colors.red, size: 32),
                ),
              ),
            ],
          );
        },
      );
    }
    else{ //NEVER EXECUTED

      // unsupported file type (illogical, because we have set the custom types before picking)
      setState(() {
        pickedFile = null;
      });
      return SizedBox.shrink();
    }
  }

  // utility functions to get pdf and video preview
  Future<Uint8List?> _generatePdfThumbnailFromLocalFile(String path) async {
    try {
      final doc = await PdfDocument.openFile(path);
      final page = await doc.getPage(1);
      final PdfPageImage? pageImage = await page.render(
        width: 800,
        height: 1000,
        format: PdfPageImageFormat.png,
      );
      await page.close();
      await doc.close();
      return  pageImage?.bytes;
    } catch (e) {
      print('error in pdf selection $e');
      setState(() {
        pickedFile = null;
      });
      return null;
    }
  }

  Widget initialImageWidget(){

    if(initialUrl == null) return SizedBox.shrink();

    if (initialUrl!.isValidUrl && initialUrl!.isPDF) {
      return FutureBuilder<Uint8List?>(
        future: _generatePdfThumbnailFromRemoteLink(initialUrl!),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(
              width: double.infinity,
              height: context.screenHeight/4,
              alignment: Alignment.center,
              color: Colors.grey.shade100,
              child: Center(child: SizedBox.square(dimension: 35.r, child: const CircularProgressIndicator())),
            );
          }
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.memory(snapshot.data!, fit: BoxFit.cover),
              const Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Icon(Icons.picture_as_pdf, color: Colors.red, size: 32),
                ),
              ),
            ],
          );
        },
      );
    }
    // it's an image
    else if(initialUrl!.isValidUrl){
      return CachedNetImage(imageUrl: initialUrl!, fit: BoxFit.cover,);
    }

    return SizedBox.shrink();
  }

  Future<Uint8List?> _generatePdfThumbnailFromRemoteLink(String url) async {
    final bytes = await NetworkAssetBundle(Uri.parse(url)).load("");
    var document = await PdfDocument.openData(bytes.buffer.asUint8List());
    final page = await document.getPage(1);
    final pageImage = await page.render(
      width: page.width,
      height: page.height,
      format: PdfPageImageFormat.png,
    );
    await page.close();
    await document.close();
    return pageImage?.bytes;
  }
}