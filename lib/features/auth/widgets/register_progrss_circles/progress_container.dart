import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';

class ProgressContainer extends StatefulWidget {
  final int phaseNumber;
  final bool isCompleted;
  final bool isCurrent;

  const ProgressContainer({super.key, required this.phaseNumber, required this.isCompleted, required this.isCurrent});

  @override
  State<ProgressContainer> createState() => _ProgressContainerState();
}

class _ProgressContainerState extends State<ProgressContainer> {

  Color containerColor = AppColors.white;
  Timer? timer;

  @override
  void initState(){
    super.initState();
    if(widget.isCurrent){
      timer = Timer.periodic(Duration(seconds: 2),(t){
       setState(() {
         containerColor == AppColors.white?
         containerColor = Color(0xffFA843C) : containerColor= AppColors.white;
       });

      });
    }
  }
  @override
  void dispose(){
    timer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      width: 40.r,
      height: 40.r,
      decoration: BoxDecoration(
        color: widget.isCurrent? containerColor : widget.isCompleted? AppColors.primaryColor: AppColors.white,
        shape: BoxShape.circle,
        border: Border.all(
          width: 1,
          color: widget.isCompleted || widget.isCurrent? AppColors.primaryColor: AppColors.white
        )
      ),
      alignment: Alignment.center,
      child: widget.isCompleted? Icon(Icons.done, color: Colors.white, size: 20,): Text(
        widget.phaseNumber.toString(),
        style: AppTextStyles.cairoTextStyle(
          size: 12,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w500,
        ),
      ) ,
    );
  }
}
