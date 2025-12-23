import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';

class UnderlineText extends StatelessWidget {
  final VoidCallback? onPressed;
  final Text text;
  const UnderlineText({super.key,required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(3.r),
        decoration: BoxDecoration(
          border: BoxBorder.fromLTRB(bottom: BorderSide(color: text.style?.color?? AppColors.titleColor, width: 1)),
        ),
        child: text ,

      ),
    );
  }
}
