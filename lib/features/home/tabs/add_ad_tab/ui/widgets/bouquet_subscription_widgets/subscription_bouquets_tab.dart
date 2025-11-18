import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/data/bouquet_model.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/widgets/bouquet_subscription_widgets/bouquet_widget.dart';

class SubscriptionBouquetsTab extends StatelessWidget {
  const SubscriptionBouquetsTab({super.key});

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
