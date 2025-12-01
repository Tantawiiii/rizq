import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rizq/core/theme/theme.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.notification,
    this.onTap,
    this.onMenuTap,
    this.onActionTap,
  });

  final NotificationModel notification;
  final VoidCallback? onTap;
  final VoidCallback? onMenuTap;
  final VoidCallback? onActionTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
      decoration: BoxDecoration(
        color: AppColors.scaffoldCyanColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        spacing: 12.r,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (notification.avatarUrl != null)
                CircleAvatar(
                  radius: 24.r,
                  backgroundImage: CachedNetworkImageProvider(
                    notification.avatarUrl!,
                  ),
                )
              else
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                  child: Icon(
                    Icons.person,
                    size: 28.w,
                    color: AppColors.primaryColor,
                  ),
                ),
              12.horizontalSpace,
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      notification.title,
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.primaryColor,
                        size: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    6.verticalSpace,
                    // Description
                    Text(
                      notification.description,
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.primaryColor,
                        size: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    8.verticalSpace,
                    // Timestamp and Action Button Row
                    Text(
                      notification.timestamp,
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.greyTextColor,
                        size: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),

              // Menu icon (vertical ellipsis)
              GestureDetector(
                onTap: onMenuTap,
                child: Padding(
                  padding: EdgeInsets.only(top: 4.h),
                  child: Icon(
                    Icons.more_vert,
                    size: 20.w,
                    color: AppColors.greyTextColor,
                  ),
                ),
              ),
            ],
          ),

          if (notification.actionButtonText != null)
            GestureDetector(
              onTap: onActionTap,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  notification.actionButtonText!,
                  style: AppTextStyles.cairoTextStyle(
                    color: AppColors.white,
                    size: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
