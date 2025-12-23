import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkelton extends StatelessWidget {
  final Widget child;
  final bool enabled;
  final bool isSliver;

  const CustomSkelton({super.key, required this.child, required this.enabled, this.isSliver = false});

  @override
  Widget build(BuildContext context) {
    return  isSliver?
    Skeletonizer.sliver(
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade300,
        highlightColor: AppColors.primaryColor.withAlpha(50),
        duration: const Duration(seconds: 1), // Optional
      ),

      // Customize default shapes and border
      containersColor: Colors.grey.shade200,

      textBoneBorderRadius: TextBoneBorderRadius(BorderRadius.circular(3.r)),
      enabled: enabled,
      // ignoreContainers: true,
      child: child,
    )
        :Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade300,
        highlightColor: AppColors.primaryColor.withAlpha(50),
        duration: const Duration(seconds: 1), // Optional
      ),

      // Customize default shapes and border
      containersColor: Colors.grey.shade200,
      textBoneBorderRadius: TextBoneBorderRadius(BorderRadius.circular(3.r)),

      enabled: enabled,
      //ignoreContainers: true,
      child: child,
    );
  }
}