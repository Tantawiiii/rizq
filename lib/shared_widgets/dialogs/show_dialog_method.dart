import 'package:flutter/material.dart';

Future<void> showCustomDialog({
  required Widget dialog,
  required BuildContext context,
}) {
  return showDialog(context: context, builder: (context) => dialog);
}