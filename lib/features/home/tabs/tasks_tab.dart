import 'package:flutter/material.dart';

import 'tab_placeholder.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabPlaceholder(
      title: 'قائمة المتابعة',
      description:
          'راجع المهام المطلوبة منك اليوم، واعرف حالة الإعلانات والمراجعات.',
      icon: Icons.list_alt_outlined,
    );
  }
}

