import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Route<dynamic>? onGenerateRoute(RouteSettings settings) => null;

class RouteManager {

  static bool isTesting = false;

  static BuildContext currentContext = navigatorKey.currentContext!;

  static Future<dynamic> navigateTo(Widget page){
    if(isTesting){
      return Future.value(null);
    }
   return  navigatorKey.currentState!.push(_materialPageRoute(page));
  }


  static Future<dynamic> navigateAndPopAll(Widget page){
    if(isTesting){
      return Future.value(null);
    }
     return navigatorKey.currentState!.pushAndRemoveUntil(
        _materialPageRoute(page),
            (_) => false,
      );
  }

  static Future<dynamic> navigateAndPopUntilFirstPage(Widget page) =>
      navigatorKey.currentState!.pushAndRemoveUntil(
          _materialPageRoute(page), (route) => route.isFirst);

  static void pop([Object? result]) {
    if(isTesting){
      return;
    }
    navigatorKey.currentState!.pop(result);
  }

  static Route<dynamic> _materialPageRoute(Widget page) =>
      MaterialPageRoute(builder: (_) => page);


  static void navigateTransitionaly(Widget page)=>navigatorKey.currentState!.push(_customPageRoute(page));

  static Route<dynamic> _customPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, animation, secondaryAnimation) => page,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {

        const beginOffset = Offset(1.0, 0.0);
        const endOffset = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: beginOffset, end: endOffset)
            .chain(CurveTween(curve: curve));
        var fadeTween = Tween(begin: 0.0, end: 1.0);

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: animation.drive(fadeTween),
            child: child,
          ),
        );
      },
      transitionDuration: Duration(milliseconds: 400),
    );
  }

}