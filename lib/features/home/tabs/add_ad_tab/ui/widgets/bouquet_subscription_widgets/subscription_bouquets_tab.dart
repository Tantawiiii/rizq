import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/data/bouquet_model.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/widgets/bouquet_subscription_widgets/bouquet_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class SubscriptionBouquetsTab extends StatelessWidget {
  const SubscriptionBouquetsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        ...List.generate(
          8,
              (index) => BouquetWidget(bouquet: dummyBouquet),
        ),
        20.vGap,
        PrimaryButton(title: LocaleKeys.createAd_skip.tr(context: context)),
        20.vGap,
      ]),
    );
  }
}


var dummyBouquet = BouquetModel('باقة شهرية', 5000, 10, 8, 5);
