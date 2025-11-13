import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';

class CachedNetImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? width;
  final double? height;

  const CachedNetImage({super.key, required this.imageUrl, this.fit = BoxFit.contain, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: fit,
      width: width,
      height: height,
      fadeInCurve: Curves.easeInOut,
      fadeInDuration: Duration(milliseconds: 400),
      fadeOutCurve: Curves.easeInOut,
      fadeOutDuration: Duration(milliseconds: 400),
      placeholder: (context, s)=>Center(child: SizedBox.square(dimension: 35.r ,child: CircularProgressIndicator())),
      errorWidget: (context, url, error)=> Padding(
        padding: const EdgeInsets.all(2.0),
        child: Image.asset(AppAssets.appLogoImage, fit: BoxFit.contain, width: width, height: height,),
      ),
    );
  }
}