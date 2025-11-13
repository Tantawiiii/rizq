import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'filter_button.dart';
import 'search_field.dart';

class SearchBarRow extends StatelessWidget {
  const SearchBarRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Bounce(
      child: Row(
        children: [
          const Expanded(child: SearchField()),
          8.horizontalSpace,
          const FilterButton(),
        ],
      ),
    );
  }
}

