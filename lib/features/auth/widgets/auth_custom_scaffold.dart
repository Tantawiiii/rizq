import 'package:flutter/material.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/utils/extension_methods.dart';

class AuthCustomScaffold extends StatelessWidget {
  final Widget? body;
  const AuthCustomScaffold({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldCyanColor,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
                top: 0,
                right: 0,

                child: SvgImage(svgPath: AppAssets.authPatternSvg, width: double.maxFinite, height: context.screenHeight *.33,)),
            body??SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
