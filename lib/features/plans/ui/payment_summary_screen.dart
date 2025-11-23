import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/features/plans/data/models/payment_summary_model.dart';
import 'package:rizq/features/plans/logic/payment_cubit.dart';
import 'package:rizq/features/plans/logic/payment_states.dart';
import 'package:rizq/features/plans/ui/widgets/payment_summary_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class PaymentSummaryScreen extends StatelessWidget {
  final PaymentSummaryModel paymentSummaryModel;

  const PaymentSummaryScreen({super.key, required this.paymentSummaryModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>sl<PaymentCubit>(),
      child: BlocBuilder<PaymentCubit, PaymentStates>(
        builder: (context,state) {
          return Scaffold(
            body: SafeArea(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    leading: const AppBarBackButton(),
                    title: Text(LocaleKeys.createAd_confirmPayment.tr(context: context)),
                    pinned: false,
                    floating: true,
                  ),

                  SliverToBoxAdapter(
                    child: PaymentSummaryWidget(paymentSummaryModel: paymentSummaryModel),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
