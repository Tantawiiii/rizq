import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';

class SinglePickedImage extends StatelessWidget {
  final String imagePath;
  final VoidCallback onImageRemoved;
  const SinglePickedImage({super.key, required this.imagePath, required this.onImageRemoved});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.r,
            color: AppColors.borderGrayColor,
          ),
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child:Stack(
          fit: StackFit.expand,
          children: [

              ClipRRect(
                  borderRadius: BorderRadius.circular(23.r),
                  child: Image.file(
                    File(imagePath),
                    fit: BoxFit.cover,
                  )),

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
                      onImageRemoved();
                    }, icon: Icon(Icons.delete, color: Colors.black,)
                ),
              ),
          ],
        )
    );
  }
}



