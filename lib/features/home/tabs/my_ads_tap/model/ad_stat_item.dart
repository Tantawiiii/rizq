import 'package:flutter/material.dart';

class AdStatItem {
  const AdStatItem({
    required this.title,
    required this.count,
    required this.icon,
    this.onTap,
  });

  final String title;
  final int count;
  final IconData icon;
  final VoidCallback? onTap;
}

