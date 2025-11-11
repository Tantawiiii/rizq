import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/shared_widgets/app_text_field.dart';
import '../../../core/shared_widgets/primary_button.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;


  @override
  Widget build(BuildContext context) {

    return ListView(
      key: const ValueKey('home_tab'),
      controller: scrollController,
      padding: EdgeInsets.symmetric(horizontal: 24.w)
          .copyWith(top: 24.h, bottom: 160.h),
      children: [
        32.verticalSpace,
      ],
    );
  }
}


