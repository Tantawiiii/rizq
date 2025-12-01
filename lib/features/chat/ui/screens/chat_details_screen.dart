import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/constant/app_texts.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/cached_net_image.dart';
import 'package:rizq/core/shared_widgets/svg_image.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
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
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        //centerTitle: true,
        title: Row(
          spacing: 12.r,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: 44.r,
              height: 44.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SizedBox.expand(child: CachedNetImage(imageUrl: 'https://fastly.picsum.photos/id/386/200/300.jpg?hmac=gk-J08Ib-URM0-Sv_pgzVkWrFR5_B7R3dvHWKfy93FU',
                fit: BoxFit.cover,
              ),),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(chat.contactName,
                    style: AppTextStyles.cairoTextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                      size: 14,
                    ),
                  ),

                  Text(
                    chat.productTitle,
                    style: AppTextStyles.cairoTextStyle(
                      size: 14,
                      color: AppColors.titleColor,
                    ),
                  )

                ],
              ),
            )
          ],
        ),
        actions: [IconButton(onPressed: (){},
            style: ButtonStyle(
              overlayColor: WidgetStatePropertyAll(Colors.transparent),
            ),
            icon: Icon(Icons.more_vert_outlined))],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          style: ButtonStyle(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
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
                ProductTipsCard(),
                SizedBox(height: 16.h),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
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

                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet:_MessageInput() ,
    );
  }
}

class _MessageInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24.r),
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
            IconButton(
                onPressed: (){},
              padding: EdgeInsets.all(12.r),
                icon: SvgImage(svgPath: AppAssets.sendSvg,width: 24.r, height: 24.r,color: Color(0xff5F7698),),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xffDCF1FF)),
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
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
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: AppTexts.writeMessHere,
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

            IconButton(
              onPressed: (){},
              padding: EdgeInsets.all(12.r),
              icon: SvgImage(svgPath: AppAssets.cameraIconSvg,width: 24.r, height: 24.r,color: Color(0xff5F7698),),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Color(0xffDCF1FF)),
                overlayColor: WidgetStatePropertyAll(Colors.transparent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

