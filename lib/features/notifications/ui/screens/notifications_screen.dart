import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/constant/app_texts.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/notifications/models/notification_model.dart';
import 'package:rizq/features/notifications/ui/widgets/notification_item.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<NotificationModel> _notifications = [
    NotificationModel(
      id: '1',
      title: AppTexts.discountCoupon,
      description: AppTexts.discountCouponDescription,
      timestamp: '2:58 PM',
      avatarUrl:
      'https://fastly.picsum.photos/id/48/5000/3333.jpg?hmac=y3_1VDNbhii0vM_FN6wxMlvK27vFefflbUSH06z98so',
      actionButtonText: AppTexts.subscribtions,
      isRead: false,
    ),
    NotificationModel(
      id: '2',
      title: AppTexts.discountCoupon,
      description: AppTexts.discountCouponDescription,
      timestamp: '2:58 PM',
      avatarUrl:
      'https://fastly.picsum.photos/id/48/5000/3333.jpg?hmac=y3_1VDNbhii0vM_FN6wxMlvK27vFefflbUSH06z98so',
      actionButtonText: AppTexts.subscribtions,
      isRead: false,
    ),
    NotificationModel(
      id: '3',
      title: AppTexts.discountCoupon,
      description: AppTexts.discountCouponDescription,
      timestamp: '2:58 PM',
      avatarUrl:
      'https://fastly.picsum.photos/id/48/5000/3333.jpg?hmac=y3_1VDNbhii0vM_FN6wxMlvK27vFefflbUSH06z98so',
      actionButtonText: AppTexts.subscribtions,
      isRead: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => RouteManager.pop(),
            icon: Icon(Icons.arrow_back_ios)),
        actions: [
          if (_notifications.isNotEmpty)
            GestureDetector(
              onTap: _markAllAsRead,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
                decoration: BoxDecoration(
                  color: Color(0xffDCF1FF),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  LocaleKeys.markAsRead.tr(context: context),
                  style: AppTextStyles.cairoTextStyle(
                    color: AppColors.titleColor,
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
        ],
        actionsPadding:
        EdgeInsetsDirectional.only(end: AppTheme.defaultEdgePadding),
        title: Text(
          LocaleKeys.notifications.tr(context: context),
          textAlign: TextAlign.center,
          style: AppTextStyles.cairoTextStyle(
            color: AppColors.primaryColor,
            size: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Expanded(
            child: _notifications.isEmpty
                ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgImage(
                    svgPath: AppAssets.noNotificationIconSvg,
                    width: 70.r,
                    height: 70.r,
                  ),
                  20.vGap,
                  Text(
                    LocaleKeys.noNotifications.tr(context: context),
                    style: AppTextStyles.cairoTextStyle(
                      fontWeight: FontWeight.w600,
                      size: 20,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  15.vGap,
                  Text(
                    LocaleKeys.weWillNotifyYou.tr(context: context),
                    style: AppTextStyles.cairoTextStyle(
                      size: 14,
                      color: AppColors.titleColor,
                    ),
                  )
                ],
              ),
            )
                : ListView.builder(
              padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
              itemCount: _notifications.length,
              itemBuilder: (context, index) {
                return NotificationItem(
                  notification: _notifications[index],
                  onTap: () {},
                  onMenuTap: () {},
                  onActionTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _markAllAsRead() {
    setState(() {
      for (var notification in _notifications) {
        notification.isRead = true;
      }
    });
  }
}
