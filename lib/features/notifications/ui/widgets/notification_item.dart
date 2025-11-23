import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          12.horizontalSpace,
          // Avatar
          if (notification.avatarUrl != null)
            CircleAvatar(
              radius: 28.r,
              backgroundImage: CachedNetworkImageProvider(
                notification.avatarUrl!,
              ),
            )
          else
            CircleAvatar(
              radius: 28.r,
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
                    size: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                6.verticalSpace,
                // Description
                Text(
                  notification.description,
                  style: AppTextStyles.cairoTextStyle(
                    color: AppColors.primaryColor,
                    size: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                8.verticalSpace,
                // Timestamp and Action Button Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Timestamp
                    Text(
                      notification.timestamp,
                      style: AppTextStyles.cairoTextStyle(
                        color: AppColors.greyTextColor,
                        size: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Action Button
                    if (notification.actionButtonText != null)
                      GestureDetector(
                        onTap: onActionTap,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Text(
                            notification.actionButtonText!,
                            style: AppTextStyles.cairoTextStyle(
                              color: AppColors.white,
                              size: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

