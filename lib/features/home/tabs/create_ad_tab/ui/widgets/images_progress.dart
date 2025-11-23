import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImagesProgress extends StatelessWidget {
  final double value;
  const ImagesProgress({super.key,required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 10.r,
      child: LinearProgressIndicator(
        value: value,
        backgroundColor: Color(0xffEBEEF3),
        color: Color(0xff00A2FF),
        borderRadius: BorderRadius.circular(50.r),
        stopIndicatorRadius: 50.r,
      ),
    );
  }
}
