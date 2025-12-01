import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/shared_widgets/cached_net_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
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
          color: AppColors.scaffoldCyanColor,
          borderRadius: BorderRadius.circular(16.r),
          // boxShadow: [
          //   BoxShadow(
          //     color: AppColors.shadowColor.withOpacity(0.07),
          //     blurRadius: 16,
          //     offset: const Offset(0, 8),
          //   ),
          // ],
        ),
        child: Column(
          children: [
            Row(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: 40.r,
                  height: 40.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SizedBox.expand(
                    child: CachedNetImage(
                        imageUrl:'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              chat.contactName,
                              style: AppTextStyles.cairoTextStyle(
                                size: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
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
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              chat.lastMessage,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.fieldTitleColor,
                                fontSize: 13.sp,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          _UnreadBadge(unreadCount: chat.unreadCount),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Divider(
              color: Color(0xffACB9CD),
              endIndent: 0,
              indent: 0,
              thickness: .3,
              height: 20,

            ),
            Row(
              spacing: 15.r,
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: Colors.white,
                    border: Border.all(color: AppColors.fieldHintColor, width: .5),
                  ),
                  child: Center(
                    child: CachedNetImage(
                      imageUrl:'https://fastly.picsum.photos/id/237/200/300.jpg?hmac=TmmQSbShHz9CdQm0NkEjx1Dyh_Y984R9LpNrpvH2D_U',
                      width: 32.r,
                      height: 23.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
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

              ],
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


class _UnreadBadge extends StatelessWidget {
  const _UnreadBadge({required this.unreadCount});

  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    if (unreadCount <= 0) {
      return const SizedBox.shrink();
    }
    return Container(
      width: 27.r,
      height: 27.r,
      decoration: BoxDecoration(
        color: const Color(0xffA8F2C6),
        shape: BoxShape.circle
      ),
      child: Center(
        child: Text(
          unreadCount.toString(),
          style: AppTextStyles.cairoTextStyle(
            color: const Color(0xff075E3A),
            fontWeight: FontWeight.w500,
            size: 12,
          ),
        ),
      ),
    );
  }
}





