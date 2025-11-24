import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/core/shared_widgets/custom_error_widget.dart';
import 'package:rizq/core/shared_widgets/custom_skelton.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/plans/data/models/bouquet_model.dart';
import 'package:rizq/features/plans/logic/payment_cubit.dart';
import 'package:rizq/features/plans/logic/payment_states.dart';
import 'package:rizq/features/plans/ui/widgets/bouquet_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class BouquetSubscriptionScreen extends StatelessWidget {
  const BouquetSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentCubit>(
      create: (context) => sl<PaymentCubit>()..getSubscriptionBouquets(),
      child: BlocBuilder<PaymentCubit, PaymentStates>(
        builder: (context, state) {
          var cubit = context.read<PaymentCubit>();
          return Scaffold(
            body: SafeArea(
              child: state is PaymentGotDataFailureState
                  ? CustomErrorWidget(
                      errorMessage: state.errorMessage,
                      onRefresh: () {
                        cubit.getSubscriptionBouquets();
                      },
                    )
                  : CustomScrollView(
                      physics: BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                          leading: const AppBarBackButton(),
                          title: Text(
                            LocaleKeys.createAd_subscriptions.tr(
                              context: context,
                            ),
                          ),
                          pinned: false,
                          floating: true,
                        ),

                        if (PaymentCubit.isTopSliverShown)
                          SliverAppBar(
                            pinned: false,
                            floating: false,
                            expandedHeight: 140.h,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.r),
                                color: Colors.white,
                                child: Column(
                                  spacing: 8.r,
                                  children: [
                                    12.vGap,
                                    Row(
                                      spacing: 10.r,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            cubit.toggleSliverBarVisibility(
                                              false,
                                            );
                                          },
                                          icon: Icon(
                                            Icons.highlight_remove_outlined,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            LocaleKeys
                                                .createAd_wannaIncreaseAdMonthlyNo
                                                .tr(context: context),
                                            style: AppTextStyles.cairoTextStyle(
                                              size: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primaryColor,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      LocaleKeys
                                          .createAd_subscribeInBouquetTitle
                                          .tr(context: context),
                                      style: AppTextStyles.cairoTextStyle(
                                        size: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.titleColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                        CustomSkelton(
                          enabled: state is PaymentGettingDataState,
                          isSliver: true,
                          child: SliverList(
                            delegate: SliverChildListDelegate([
                              ...List.generate(
                                state is PaymentGettingDataState
                                    ? 8
                                    : cubit.subscriptionBouquets.length,
                                (index) {
                                  return state is PaymentGettingDataState
                                      ? BouquetWidget(bouquet: dummyBouquet)
                                      : BouquetWidget(
                                          bouquet:
                                              cubit.subscriptionBouquets[index],
                                        ).animate().slideX(duration: 400.ms);
                                },
                              ),

                              20.vGap,
                            ]),
                          ),
                        ),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}

var dummyBouquet = BouquetModel(
  1,
  'Dummy Buoquet',
  5000,
  'Appropriate for companies and sellers',
  'USD',
  30,
  10,
  3,
  1,
  1,
  1,
);
