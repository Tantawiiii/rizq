

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constant/app_assets.dart';
import '../../../core/constant/app_colors.dart';
import '../models/chat.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.message});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final align = message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final bubbleColor = message.isMe ? AppColors.primaryColor : AppColors.accentColor;
    final textColor = message.isMe ? AppColors.white : AppColors.fieldTitleColor;
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(18.r),
      topRight: Radius.circular(18.r),
      bottomLeft: Radius.circular(message.isMe ? 18.r : 4.r),
      bottomRight: Radius.circular(message.isMe ? 4.r : 18.r),
    );

    return Column(
      crossAxisAlignment: align,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: borderRadius,
          ),
          child: Text(
            message.text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontSize: 13.sp,
            ),
          ),
        ),
        SizedBox(height: 6.h),
        Row(
          mainAxisSize: MainAxisSize.min,
          textDirection: TextDirection.rtl,
          children: [
            Text(
              _formatTime(message.time),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.fieldHintColor,
                fontSize: 11.sp,
              ),
            ),
            if (message.isMe && message.isRead) ...[
              SizedBox(width: 4.w),
              SvgPicture.asset(
                AppAssets.checkReadSvg,
                width: 16.w,
                height: 16.h,
              ),
            ],
          ],
        ),
      ],
    );
  }

  String _formatTime(TimeOfDay timeOfDay) {
    final hour = timeOfDay.hourOfPeriod == 0 ? 12 : timeOfDay.hourOfPeriod;
    final minute = timeOfDay.minute.toString().padLeft(2, '0');
    final period = timeOfDay.period == DayPeriod.am ? 'ص' : 'م';
    return '$hour:$minute $period';
  }
}