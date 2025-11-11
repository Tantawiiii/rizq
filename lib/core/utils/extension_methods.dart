import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ContextExtension on BuildContext{

  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

}
extension Gaps on num{
  SizedBox get vGap => SizedBox(height: this.h);
  SizedBox get hGap => SizedBox(width: this.w);
}