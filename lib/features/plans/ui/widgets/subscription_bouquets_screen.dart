import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/plans/data/models/bouquet_model.dart';


import 'bouquet_widget.dart';


class SubscriptionBouquetsScreen extends StatelessWidget {
  const SubscriptionBouquetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        ...List.generate(
          8,
              (index) => BouquetWidget(bouquet: dummyBouquet),
        ).animate().slideX(
        duration: Duration(milliseconds: 400)),

        20.vGap,
      ]),
    );
  }
}


var dummyBouquet = BouquetModel('باقة شهرية', 5000, 10, 8, 5);
