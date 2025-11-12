import 'package:flutter/material.dart';
import 'tab_placeholder.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabPlaceholder(
      title: 'الملف الشخصي',
      description:
          'تابع معلوماتك الشخصية، حدّث بياناتك أو راجع نشاطك الأخير من هنا.',
      icon: Icons.person_outline,
    );
  }
}

