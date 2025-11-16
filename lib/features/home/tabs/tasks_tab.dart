import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <_AdStatItem>[
      _AdStatItem(
        title: 'الإعلانات المميزة',
        count: 0,
        icon: Icons.verified_outlined,
        onTap: () {},
      ),
      _AdStatItem(
        title: 'الإعلانات الفعالة',
        count: 1,
        icon: Icons.check_circle_outline,
        onTap: () {},
      ),
      _AdStatItem(
        title: 'المسودات',
        count: 0,
        icon: Icons.inbox_outlined,
        onTap: () {},
      ),
      _AdStatItem(
        title: 'الإعلانات المفضلة',
        count: 127,
        icon: Icons.favorite_border,
        onTap: () {},
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        title: Text(" إعلاناتي"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          children: [
            16.verticalSpace,
            _StatsGrid(items: items),
          ],
        ),
      ),
    );
  }
}


class _StatsGrid extends StatelessWidget {
  const _StatsGrid({required this.items});
  final List<_AdStatItem> items;

  @override
  Widget build(BuildContext context) {
    final spacing = 16.w;
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardWidth = (constraints.maxWidth - spacing) / 2;
        return Wrap(
          spacing: spacing,
          runSpacing: spacing,
          children: items
              .map(
                (it) => SizedBox(
                  width: cardWidth,
                  child: _AdStatCard(item: it),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _AdStatCard extends StatelessWidget {
  const _AdStatCard({required this.item});
  final _AdStatItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: item.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.overlayColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: SizedBox(
          height: 144.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(item.icon, size: 28.w, color: AppColors.primaryColor),
              12.verticalSpace,
              Text(
                item.title,
                textAlign: TextAlign.start,
                style: AppTextStyles.poppinsTextStyle(
                  color: AppColors.primaryColor,
                  size: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.chevron_left,
                    size: 18.w,
                    color: AppColors.primaryColor,
                  ),
                  const Spacer(),
                  Text(
                    '${item.count}',
                    style: AppTextStyles.poppinsTextStyle(
                      color: AppColors.primaryColor,
                      size: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AdStatItem {
  const _AdStatItem({
    required this.title,
    required this.count,
    required this.icon,
    required this.onTap,
  });
  final String title;
  final int count;
  final IconData icon;
  final VoidCallback onTap;
}
