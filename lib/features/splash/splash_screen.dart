import 'package:flutter/material.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/auth/login/ui/screens/login_screen.dart';
import 'package:rizq/features/home/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // moves from top to center
  late Animation<Offset> _slideAnim;



  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    // Use fractional offsets:
    // - start above the screen (y ~ -1.5)
    // - move to center (Offset(0, 0))
    // - stay (ConstantTween)
    // - move down off-screen (y ~ 2.5)
    _slideAnim = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween(begin: const Offset(0, -2.5), end: const Offset(0, 0))
            .chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
      TweenSequenceItem(
        tween: ConstantTween<Offset>(const Offset(0, 0)),
        weight: 20,
      ),
      TweenSequenceItem(
        tween: Tween(begin: const Offset(0, 0), end: const Offset(0, 2.5))
            .chain(CurveTween(curve: Curves.easeIn)),
        weight: 40,
      ),
    ]).animate(_controller);

    _controller.forward().whenComplete(()=>RouteManager.navigateAndPopAll( MainScreen()));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: SlideTransition(
          position: _slideAnim,
          child: Image.asset(
          AppAssets.splashLogoImage,
          width: context.screenWidth * .5,
          height: context.screenHeight * .25,
        ),
        ),
      )
    );
  }
}
