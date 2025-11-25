import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  final bool initialValue;
  final void Function(bool) onChanged;
  const CustomSwitch({super.key, required this.initialValue, required this.onChanged});

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool value = false;
  @override
  void initState(){
    super.initState();
    value = widget.initialValue;
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:TextDirection.ltr,
      child: SizedBox(
        height: 24.r,
        child: Transform.scale(
          scale: .75,
          child: Switch.adaptive(
            value: value,
            onChanged: (v){
              setState(() {
                value = v;
              });
              widget.onChanged(v);
            },
            overlayColor: WidgetStatePropertyAll(Color(0xffF0F8FF)),
            thumbColor: WidgetStatePropertyAll(Colors.white),
            padding: EdgeInsets.zero,
            //trackColor: WidgetStatePropertyAll(AppColors.greyTextColor),
            trackOutlineColor: WidgetStatePropertyAll(AppColors.primaryColor),
            trackOutlineWidth: WidgetStatePropertyAll(0),
            activeTrackColor: AppColors.primaryColor ,
            inactiveTrackColor: Colors.grey,
          ),
        ),
      ),);
  }
}