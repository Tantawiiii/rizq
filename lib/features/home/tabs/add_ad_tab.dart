import 'package:flutter/material.dart';

import 'tab_placeholder.dart';

class AddAdTab extends StatelessWidget {
  const AddAdTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabPlaceholder(
      title: 'إنشاء إعلان جديد',
      description:
          'ابدأ بإضافة الصور والتفاصيل لعرضك الجديد. هذه الشاشة سيتم ربطها لاحقًا بنموذج النشر.',
      icon: Icons.add_circle_outline,
    );
  }
}

