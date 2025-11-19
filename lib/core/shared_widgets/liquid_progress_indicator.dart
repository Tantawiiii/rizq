import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:rizq/core/constant/app_colors.dart';

class LiquidProgressIndicator extends StatelessWidget {
  final double value;

  const LiquidProgressIndicator({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return LiquidCircularProgressIndicator(
      value: value,
      backgroundColor: AppColors.primaryColor,
      valueColor: const AlwaysStoppedAnimation(AppColors.orangeColor),
    );
  }
}
