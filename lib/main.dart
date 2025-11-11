import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          home: Scaffold(
            appBar: AppBar(
              title: Text('Flutter Demo', style: TextStyle(fontSize: 20.sp)),
            ),
            body: Center(
              child: Text('Hello, World!', style: TextStyle(fontSize: 18.sp)),
            ),
          ),
        );
      },
    );
  }
}
