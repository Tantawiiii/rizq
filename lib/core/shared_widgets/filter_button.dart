import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constant/app_assets.dart';
import '../constant/app_colors.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  void _handleTap(BuildContext context) {
    final scaffoldState = Scaffold.maybeOf(context);
    if (scaffoldState == null) {
      return;
    }
    if (scaffoldState.isEndDrawerOpen) {
      Navigator.of(context).maybePop();
    } else {
      scaffoldState.openEndDrawer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () => _handleTap(context),
      child: Container(
        width: 54.w,
        height: 54.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.textFieldBorderColor),
          color: AppColors.white,
        ),
        padding: EdgeInsets.all(14.w),
        child: SvgPicture.asset(AppAssets.filterSvg, fit: BoxFit.contain),
      ),
    );
  }
}
