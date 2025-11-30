import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/home/tabs/create_ad_tab/ui/widgets/ad_info_widget.dart';
import 'package:rizq/features/update_ad/logic/update_ad_cubit.dart';
import 'package:rizq/features/update_ad/ui/widgets/update_ad_info_widget.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class UpdateAdInfoScreen extends StatelessWidget {
  const UpdateAdInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> sl<UpdateAdCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverAppBar(
                leading: const AppBarBackButton(),
                title: Text(LocaleKeys.createAd_updateAdInfo.tr(context: context)),
                pinned: false,
                floating: true,
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
                  child: Column(
                    children: [

                      UpdateAdInfoWidget(),
                      20.vGap,
                    ],
                  ),
                ),
              )


            ],
          ),
        )
      ),
    );
  }
}
