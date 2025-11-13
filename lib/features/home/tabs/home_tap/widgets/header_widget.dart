import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/features/chat/chat_list_screen.dart';

Widget HeaderWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset(
        AppAssets.rizqLogoPng,
        width: 60,
        height: 80.h,
        fit: BoxFit.cover,
      ),
      Row(
        spacing: 8,
        children: [
          Bounce(
            child: SvgPicture.asset(
              AppAssets.heartSvg,
              width: 24.w,
              height: 24.h,
            ),
          ),
          Bounce(
            onTap: () {
              RouteManager.navigateTo(const ChatListScreen());
            },
            child: SvgPicture.asset(
              AppAssets.chatSvg,
              width: 24.w,
              height: 24.h,
            ),
          ),
          Bounce(
            child: SvgPicture.asset(
              AppAssets.notificationSvg,
              width: 24.w,
              height: 24.h,
            ),
          ),
        ],
      ),
    ],
  );
}
