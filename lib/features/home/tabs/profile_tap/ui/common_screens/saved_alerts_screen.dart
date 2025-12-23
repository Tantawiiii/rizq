import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/core/theme/theme.dart';
import 'package:rizq/core/utils/extension_methods.dart';
import 'package:rizq/generated/locale_keys.g.dart';
import 'package:rizq/shared_widgets/app_bar_backbutton.dart';
import 'package:rizq/shared_widgets/dialogs/remove_alert_dialog.dart';
import 'package:rizq/shared_widgets/dialogs/show_dialog_method.dart';
import 'package:rizq/shared_widgets/dialogs/stop_alert_dialog.dart';
import 'package:rizq/shared_widgets/primary_button.dart';
import 'package:rizq/shared_widgets/svg_image.dart';

class SavedAlertsScreen extends StatelessWidget {
  const SavedAlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: AppBarBackButton(),
          title: Text(
            LocaleKeys.Settings_savedAlerts.tr(context: context),
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        backgroundColor: AppColors.whiteBackground,
        body: ListView.separated(
          physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(AppTheme.defaultEdgePadding),
            itemBuilder: (context,index){
          return AlertWidget(title: 'بحث محفوظ باسم كيا دمشق');
        }, separatorBuilder: (context,index)=>15.vGap, itemCount: 12),
    );
  }
}

class AlertWidget extends StatelessWidget {
  final String title;
  const AlertWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.scaffoldCyanColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 30.r,
        children: [
          Text(
            title,
            style: AppTextStyles.cairoTextStyle(
              size: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
          Row(
            spacing: 15.r,
            children: [
              Expanded(child: PrimaryButton(
                  title: LocaleKeys.Settings_stopAlert.tr(),
              onPressed: (){
                    showCustomDialog(dialog: StopAlertDialog(), context: context);
              },
              ),
              ),
              IconButton(
                  style: ButtonStyle(
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8.r))),
                    padding: WidgetStatePropertyAll(EdgeInsets.all(12.r)),
                    backgroundColor: WidgetStatePropertyAll(Color(0xffDCF1FF))
                  ),
                  onPressed: (){}, icon: SvgImage(
                svgPath: AppAssets.editIconSvg,
                width: 18.r,
                height: 18.r,
              )),
              IconButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8.r))),
                      padding: WidgetStatePropertyAll(EdgeInsets.all(12.r)),
                      backgroundColor: WidgetStatePropertyAll(Color(0xffFEF3F2))
                  ),
                  onPressed: (){
                    showCustomDialog(dialog: RemoveAlertDialog(), context: context);
                  }, icon: SvgImage(
                svgPath: AppAssets.trashIconSvg,
                width: 18.r,
                height: 18.r,
              )),

            ],
          )
        ],
      ),
    );
  }
}

