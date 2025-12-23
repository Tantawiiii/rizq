
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const CustomTextButton({
    super.key,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(Color(0xffF0F8FF)),
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
      ),
      child: child,
    );
  }
}