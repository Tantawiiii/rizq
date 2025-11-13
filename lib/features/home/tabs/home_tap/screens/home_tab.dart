import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rizq/features/home/tabs/home_tap/widgets/ads_sections.dart';
import 'package:rizq/features/home/tabs/home_tap/widgets/header_widget.dart';
import 'package:rizq/features/home/tabs/home_tap/widgets/search_categories.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      key: const ValueKey('home_tab'),
      controller: scrollController,
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
      ).copyWith(top: 8.h, bottom: 60.h),
      children: [
        HeaderWidget(),
        8.verticalSpace,
        const HomeSearchAndCategories(),
        24.verticalSpace,
        const HomeAdsSections(),
      ],
    );
  }
}
