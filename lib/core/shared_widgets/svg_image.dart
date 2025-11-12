import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  final String svgPath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color? color;

  const SvgImage({super.key, required this.svgPath, this.width, this.height, this.fit = BoxFit.contain, this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgPath,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}
