import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/features/chat/models/chat.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.chat, required this.onTap});

  final Chat chat;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 120),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withOpacity(0.07),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Avatar(chat: chat),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Expanded(
                        child: Text(
                          chat.contactName,
                          style: Theme.of(context).textTheme.bodyLarge
                              ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryColor,
                                fontSize: 16.sp,
                              ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        _formatTime(chat.lastMessageTime),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.fieldHintColor,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    chat.lastMessage,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.fieldTitleColor,
                      fontSize: 13.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _UnreadBadge(unreadCount: chat.unreadCount),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          chat.productTitle,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: AppColors.fieldHintColor,
                                fontSize: 12.sp,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.right,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Container(
                        height: 32.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                          color: AppColors.accentColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppAssets.adsSvg,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(TimeOfDay timeOfDay) {
    final hour = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    final period = timeOfDay.period == DayPeriod.am ? 'ص' : 'م';
    return '$hour:$minute $period';
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 24.r,
      backgroundColor: AppColors.accentColor,
      backgroundImage: chat.avatar,
      child: chat.avatar == null
          ? Text(
              chat.initials,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            )
          : null,
    );
  }
}

class _UnreadBadge extends StatelessWidget {
  const _UnreadBadge({required this.unreadCount});

  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    if (unreadCount <= 0) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: const Color(0xffE1F8E2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        unreadCount.toString(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: const Color(0xff0F9A34),
          fontWeight: FontWeight.w600,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}





