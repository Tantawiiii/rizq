import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/company/widgets/field_item_widget.dart';

class CommercialFileDataCardWidget extends StatelessWidget {
  const CommercialFileDataCardWidget({
    super.key,
    required this.title,
    required this.leftColumnFields,
    required this.rightColumnFields,
  });

  final String title;
  final List<FieldData> leftColumnFields;
  final List<FieldData> rightColumnFields;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.overlayColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          20.verticalSpace,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...leftColumnFields.asMap().entries.map((entry) {
                      final index = entry.key;
                      final field = entry.value;
                      return Column(
                        children: [
                          if (index > 0) 12.verticalSpace,
                          FieldItemWidget(
                            label: field.label,
                            value: field.value,
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
              20.horizontalSpace,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...rightColumnFields.asMap().entries.map((entry) {
                      final index = entry.key;
                      final field = entry.value;
                      return Column(
                        children: [
                          if (index > 0) 12.verticalSpace,
                          FieldItemWidget(
                            label: field.label,
                            value: field.value,
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FieldData {
  const FieldData({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;
}

