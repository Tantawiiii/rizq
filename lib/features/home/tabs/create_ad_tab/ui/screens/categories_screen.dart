import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rizq/core/di/inject.dart';
import 'package:rizq/core/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/core/shared_widgets/custom_error_widget.dart';
import 'package:rizq/core/shared_widgets/custom_skelton.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/features/auth/register/data/models/category_model.dart';
import 'package:rizq/features/home/tabs/create_ad_tab/logic/create_ad_cubit/create_ad_cubit.dart';
import 'package:rizq/features/home/tabs/create_ad_tab/logic/create_ad_cubit/create_ad_states.dart';
import 'package:rizq/generated/locale_keys.g.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CreateAdCubit>()..getCategories(),
      child: BlocBuilder<CreateAdCubit, CreateAdStates>(
        builder: (context, state) {
          var cubit = context.read<CreateAdCubit>();
          return Scaffold(
            body: SafeArea(
              child: state is CreateAdGetDataFailureState
                  ? CustomErrorWidget(
                      errorMessage: state.errorMessage,
                      onRefresh: () {
                        cubit.getCategories();
                      },
                    )
                  : CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverAppBar(
                         // leading: const AppBarBackButton(),
                          title: Text(
                            LocaleKeys.createAd_addNewAd.tr(context: context),
                          ),
                          pinned: false,
                          floating: true,
                        ),
                        SliverAppBar(
                          title: Text(
                            LocaleKeys.createAd_chooseCategory.tr(
                              context: context,
                            ),
                          ),
                          pinned: true,
                          floating: false,
                        ),
                        CustomSkelton(
                          isSliver: true,
                          enabled: state is CreateAdGettingDataState,
                          child: SliverPadding(
                            padding: EdgeInsets.all(
                              AppTheme.defaultEdgePadding,
                            ),
                            sliver: SliverGrid(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing:
                                        AppTheme.defaultEdgePadding,
                                    mainAxisSpacing:
                                        AppTheme.defaultEdgePadding,
                                    childAspectRatio: .8,
                                  ),
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  return CategoryItem(
                                    model: state is CreateAdGettingDataState
                                        ? CategoryModel(
                                            id: 1,
                                            name: 'الكترونيات',
                                            imageUrl:
                                                'https://fastly.picsum.photos/id/48/5000/3333.jpg?hmac=y3_1VDNbhii0vM_FN6wxMlvK27vFefflbUSH06z98so',
                                          )
                                        : cubit.categories[index],
                                  );
                                },
                                childCount: state is CreateAdGettingDataState
                                    ? 8
                                    : cubit.categories.length,
                              ),
                            ),
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
