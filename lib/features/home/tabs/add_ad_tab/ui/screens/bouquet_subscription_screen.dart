import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/add_ad_cubit.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/logic/add_ad_states.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/widgets/bouquet_subscription_widgets/sliding_button.dart';
import 'package:rizq/features/home/tabs/add_ad_tab/ui/widgets/bouquet_subscription_widgets/subscription_bouquets_tab.dart';

class BouquetSubscriptionScreen extends StatelessWidget {
  const BouquetSubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddAdCubit>(
      create: (context)=>sl<AddAdCubit>(),
      child: BlocBuilder<AddAdCubit,AddAdStates>(
          builder: (context,state){
            print('in bouquets screen, rebuild');
            var cubit = context.read<AddAdCubit>();
            return Scaffold(
              body: SafeArea(
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                  slivers: [

                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      centerTitle: true,
                      title: SlidingButton() ,
                      pinned: true,
                    ),
                    if (cubit.adAction == AdAction.subscribeInBouquet)
                      SubscriptionBouquetsTab()
                    else
                      SliverToBoxAdapter(child: Container(color: Colors.red, height: 400)),
                    // SliverFillRemaining(
                    //   child: AnimatedSwitcher(
                    //     duration: const Duration(milliseconds: 400),
                    //     transitionBuilder: (child, animation) {
                    //       final offsetAnimation =
                    //       Tween<Offset>(
                    //         begin: const Offset(1, 0),
                    //         end: Offset.zero,
                    //       ).animate(
                    //         CurvedAnimation(
                    //           parent: animation,
                    //           curve: Curves.easeInOut,
                    //         ),
                    //       );
                    //
                    //       return SlideTransition(position: offsetAnimation, child: child);
                    //     },
                    //     child: cubit.adAction == AdAction.subscribeInBouquet? SubscriptionBouquetsTab() : Container(color: Colors.red,)  ,
                    //   ),
                    // )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
