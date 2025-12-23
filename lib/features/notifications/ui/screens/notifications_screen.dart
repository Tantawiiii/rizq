import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/features/notifications/models/notification_model.dart';
import 'package:rizq/features/notifications/ui/widgets/notification_item.dart';


class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<NotificationModel> _notifications = [
    NotificationModel(
      id: '1',
      title: 'AppTexts.discountCoupon',
      description: 'AppTexts.discountCouponDescription',
      timestamp: '2:58 PM',
      avatarUrl:
          'https://fastly.picsum.photos/id/48/5000/3333.jpg?hmac=y3_1VDNbhii0vM_FN6wxMlvK27vFefflbUSH06z98so',
      actionButtonText: 'AppTexts.subscribtions',
      isRead: false,
    ),
    NotificationModel(
      id: '2',
      title: 'AppTexts.discountCoupon',
      description: 'AppTexts.discountCouponDescription',
      timestamp: '2:58 PM',
      avatarUrl:
          'https://fastly.picsum.photos/id/48/5000/3333.jpg?hmac=y3_1VDNbhii0vM_FN6wxMlvK27vFefflbUSH06z98so',
      actionButtonText: 'AppTexts.subscribtions',
      isRead: false,
    ),
    NotificationModel(
      id: '3',
      title: 'AppTexts.discountCoupon',
      description: 'AppTexts.discountCouponDescription',
      timestamp: '2:58 PM',
      avatarUrl:
          'https://fastly.picsum.photos/id/48/5000/3333.jpg?hmac=y3_1VDNbhii0vM_FN6wxMlvK27vFefflbUSH06z98so',
      actionButtonText: 'AppTexts.subscribtions',
      isRead: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            // Mark as Read Button
            _buildMarkAsReadButton(),
            // Notifications List
            Expanded(
              child: _buildNotificationsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Row(
        children: [
          // Back Button
          IconButton(
            onPressed: () => RouteManager.pop(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20.w,
              color: AppColors.primaryColor,
            ),
          ),
          // Title
          Expanded(
            child: Text(
              'AppTexts.notifications',
              textAlign: TextAlign.center,
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.primaryColor,
                size: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // Spacer to balance the back button
          SizedBox(width: 48.w),
        ],
      ),
    );
  }

  Widget _buildMarkAsReadButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: _markAllAsRead,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.accentColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              'AppTexts.markAsRead',
              style: AppTextStyles.cairoTextStyle(
                color: AppColors.primaryColor,
                size: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationsList() {
    if (_notifications.isEmpty) {
      return Center(
        child: Text(
          'لا توجد إشعارات',
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.greyTextColor,
            size: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemCount: _notifications.length,
      itemBuilder: (context, index) {
        return NotificationItem(
          notification: _notifications[index],
          onTap: () {
            // Handle notification tap
          },
          onMenuTap: () {
            // Handle menu tap
          },
          onActionTap: () {
            // Handle action button tap
          },
        );
      },
    );
  }

  void _markAllAsRead() {
    setState(() {
      for (var notification in _notifications) {
        notification.isRead = true;
      }
    });
    // Show snackbar or perform action
  }
}


