import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/router/route_manager.dart';


class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: (){
          RouteManager.pop();
        },
        icon: Icon(
           Icons.arrow_back_ios_new_outlined,
          color: Colors.black,
          size: 24.r,
        ),
    );
  }
}
