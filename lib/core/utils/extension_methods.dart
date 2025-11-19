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

extension StringUtils on String{
  bool get isValidEmail=> RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(this);

  bool get hasManySpaces{
    int spaces = 0;

    for(int i =0 ; i < length; i++){
      if(this[i] == ' '){
        spaces++;
      }
    }
    return (spaces > (length / 2));
  }

  bool get containsNumbers{
    for(int i =0 ; i < length; i++){
      if(int.tryParse(this[i]) != null){
        return true;
      }
    }
    return false;
  }

  bool get isMixNumbersChars{
    bool isMix = false;
    for(int i =0 ; i < length; i++){
      if(int.tryParse(this[i]) != null){
        if(i != 0){
          isMix = true;
        }
      }
    }
    return isMix;
}
  bool get isImage => endsWith('jpg') || endsWith('jpeg') || endsWith('png') ;
  bool get isPDF => endsWith('pdf');

  bool get isValidUrl => startsWith('http') || startsWith('https');

  Map<String, double>? get extractCoordinates {
    // Universal coordinates finder
    final regex = RegExp(
      r'(-?\d{1,3}\.\d+)[,\s]+(-?\d{1,3}\.\d+)', // Two decimal numbers separated by comma/space
    );

    final match = regex.firstMatch(this);
    if (match == null) return null;

    final lat = double.parse(match.group(1)!);
    final lon = double.parse(match.group(2)!);

    // Validate valid latitude/longitude ranges
    if (lat.abs() > 90 || lon.abs() > 180) return null;

    return {'lat': lat, 'lon': lon};
  }
}