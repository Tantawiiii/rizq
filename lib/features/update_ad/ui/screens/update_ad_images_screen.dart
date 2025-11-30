import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/core/shared_widgets/primary_button.dart';
import 'package:rizq/core/shared_widgets/underline_text.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/features/home/tabs/create_ad_tab/logic/create_ad_cubit/create_ad_cubit.dart';
import 'package:rizq/features/home/tabs/create_ad_tab/logic/create_ad_cubit/create_ad_states.dart';
import 'package:rizq/features/home/tabs/create_ad_tab/ui/screens/successful_published_ad_screen.dart';
import 'package:rizq/features/home/tabs/create_ad_tab/ui/widgets/multiple_image_picker_widget.dart';
import 'package:rizq/features/home/tabs/create_ad_tab/ui/widgets/single_image_picker_widget.dart';
import 'package:rizq/features/update_ad/logic/update_ad_cubit.dart';
import 'package:rizq/features/update_ad/logic/update_ad_states.dart';
import 'package:rizq/features/update_ad/ui/screens/successful_updated_ad_screen.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class UpdateAdImagesScreen extends StatelessWidget {
  const UpdateAdImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UpdateAdCubit, UpdateAdStates>(
          builder: (context,state){
            var cubit = context.read<UpdateAdCubit>();

            return SafeArea(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    leading: const AppBarBackButton(),
                    title: Text(LocaleKeys.createAd_updateAdImages.tr(context: context)),
                    pinned: false,
                    floating: true,
                  ),

                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    title: Text(
                      LocaleKeys.createAd_addingAdImages.tr(context: context),
                    ),
                    pinned: true,
                    floating: false,
                    bottom: PreferredSize(
                      preferredSize: Size(double.maxFinite, 20),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: AppTheme.defaultEdgePadding,
                          ),
                          child: Text(
                           cubit.adImages.isEmpty ? LocaleKeys.createAd_addTo6Images.tr(context: context):
                            cubit.adImages.length == 6?
                                LocaleKeys.createAd_youHaveUploadedAll.tr(context: context)
                                :LocaleKeys.createAd_youHaveUploadedNM.tr(context:context, args: [
                              cubit.adImages.length.toString()
                            ]),
                            style: AppTextStyles.cairoTextStyle(
                              size: 14,
                              color: Color(0xffFA843C),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
                      child: Column(
                        children: [
                          // GRID as a normal GridView

                          if(cubit.adImages.isEmpty)
                            MultipleImagePickerWidget(
                              onImagesSelected: (imagePaths){
                                cubit.assignNewImageList(imagePaths);
                              },
                            ),
                          if(cubit.adImages.isNotEmpty)
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: cubit.adImages.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: AppTheme.defaultEdgePadding,
                              mainAxisSpacing: AppTheme.defaultEdgePadding,
                            ),
                            itemBuilder: (context, index) {
                              return SinglePickedImage(
                                  imagePath: cubit.adImages[index],
                                  onImageRemoved: (){
                                    cubit.removeFromAdImages(index);
                                  }
                              );
                            },
                          ),

                          30.vGap,
                          Row(
                            spacing: 20.r,
                            children: [
                              Expanded(
                                child: PrimaryButton(
                                  title: LocaleKeys.createAd_saveUpdates.tr(context: context),
                                  disabledColor: AppColors.disabledColor,
                                  backgroundColor: AppColors.primaryColor,
                                  onPressed: cubit.adImages.length >= 2 ?(){
                                    RouteManager.navigateTo(SuccessfulUpdateAdScreen());
                                  } : null,
                                ),
                              ),

                              if(cubit.adImages.isNotEmpty && cubit.adImages.length<6)
                              Expanded(
                                child: PrimaryButton(
                                  title: LocaleKeys.createAd_uploadMore.tr(),
                                  backgroundColor: AppColors.scaffoldCyanColor,
                                  textStyle: AppTextStyles.cairoTextStyle(
                                    size: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.titleColor,
                                  ),
                                  onPressed: (){
                                    cubit.pickImageAgain();
                                  },

                                ),
                              ),
                            ],
                          ),

                          20.vGap,

                          UnderlineText(
                            text: Text(
                              LocaleKeys.createAd_deleteAllImage.tr(context: context),
                              style: AppTextStyles.cairoTextStyle(
                                size: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.errorBorderColor,
                              ),
                            ),
                            onPressed: (){
                              cubit.assignNewImageList([]);
                            },
                          ),


                          35.vGap,
                        ],
                      ),
                    ),
                  )

                ],
              ),
            );
          }
      ),
    );
  }

}
