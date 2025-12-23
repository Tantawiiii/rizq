import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/features/chat/models/chat.dart';
import 'package:rizq/features/chat/ui/widgets/message_bubble.dart';
import 'package:rizq/features/chat/ui/widgets/product_tip_card.dart';


class ChatDetailsScreen extends StatelessWidget {
  const ChatDetailsScreen({
    super.key,
    required this.chat,
  });

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldCyanColor,
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldCyanColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            chat.contactName,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 18.sp,
                ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: AppColors.primaryColor,
            onPressed: RouteManager.pop,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: Column(
                children: [
                  ProductTipsCard(chat: chat),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 24.h,
                        ),
                        itemCount: chat.messages.length,
                        itemBuilder: (context, index) {
                          final message = chat.messages[index];
                          return Padding(
                            padding: EdgeInsets.only(bottom: 16.h),
                            child: MessageBubble(message: message),
                          );
                        },
                      ),
                    ),
                    _MessageInput(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MessageInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.scaffoldCyanColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.05),
            offset: const Offset(0, -4),
            blurRadius: 12,
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          spacing: 12.r,
          children: [
            Container(
              height: 48.w,
              width: 48.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  AppAssets.sendSvg,
                  width: 20.w,
                  height: 20.h,
                  colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24.r),
                  border: Border.all(
                    color: AppColors.borderGrayColor.withOpacity(0.4),
                  ),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'هنا اكتب رسالة ',
                    border: InputBorder.none,
                    hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.fieldHintColor,
                          fontSize: 12.sp,
                        ),
                  ),
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            Container(
              height: 48.w,
              width: 48.w,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Center(
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

