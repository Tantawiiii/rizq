import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({super.key});

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  bool _discountOnly = false;
  RangeValues _priceRange = const RangeValues(100, 5000);

  final List<String> _brands = ['آيفون', 'سامسونج', 'هواوي'];
  final List<String> _colors = ['أبيض', 'أسود', 'أزرق'];
  final List<String> _accessories = ['سماعات', 'شاحن', 'غطاء'];
  final List<String> _storages = ['64 جيجا', '128 جيجا', '256 جيجا'];
  final List<String> _publishTimes = [
    'اليوم',
    'أمس',
    'الأسبوع الماضي',
    'منذ شهر',
  ];
  final List<String> _sortOptions = [
    'من الأقدم للأحدث',
    'من الأحدث للأقدم',
    'الأعلى سعراً',
    'الأقل سعراً',
  ];

  String? _selectedBrand = 'آيفون';
  String? _selectedColor = 'أبيض';
  String? _selectedAccessory = 'سماعات';
  String? _selectedStorage = '64 جيجا';
  String? _selectedPublishTime = 'اليوم';
  String? _selectedSort = 'من الأقدم للأحدث';

  @override
  Widget build(BuildContext context) {
    final double drawerWidth = MediaQuery.of(context).size.width * 0.88;

    return Drawer(
      width: drawerWidth,
      backgroundColor: AppColors.scaffoldCyanColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          bottomLeft: Radius.circular(32),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 48.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'الفلترة',
                      style: AppTextStyles.poppinsTextStyle(
                        color: AppColors.primaryColor,
                        size: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    PositionedDirectional(
                      end: 0,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).maybePop(),
                        icon: Icon(
                          Icons.close,
                          color: AppColors.primaryColor,
                          size: 22.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              24.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'تخفيض',
                    style: AppTextStyles.poppinsTextStyle(
                      color: AppColors.fieldTitleColor,
                      size: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Switch(
                    value: _discountOnly,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) => setState(() => _discountOnly = value),
                  ),
                ],
              ),
              24.verticalSpace,
              Text(
                'السعر',
                style: AppTextStyles.poppinsTextStyle(
                  color: AppColors.fieldTitleColor,
                  size: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              12.verticalSpace,
              Row(
                children: [
                  _RangeChip(
                    label: 'الحد الأدنى',
                    value: _priceRange.start.round(),
                  ),
                  12.horizontalSpace,
                  _RangeChip(
                    label: 'الحد الأقصى',
                    value: _priceRange.end.round(),
                  ),
                ],
              ),
              SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  thumbColor: AppColors.primaryColor,
                  activeTrackColor: AppColors.primaryColor,
                  inactiveTrackColor: AppColors.textFieldBorderColor
                      .withOpacity(0.4),
                ),
                child: RangeSlider(
                  values: _priceRange,
                  min: 0,
                  max: 10000,
                  divisions: 200,
                  onChanged: (values) => setState(() => _priceRange = values),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _FilterDropdown(
                        label: 'العلامة التجارية',
                        value: _selectedBrand,
                        items: _brands,
                        onChanged: (value) =>
                            setState(() => _selectedBrand = value),
                      ),
                      16.verticalSpace,
                      _FilterDropdown(
                        label: 'اللون',
                        value: _selectedColor,
                        items: _colors,
                        onChanged: (value) =>
                            setState(() => _selectedColor = value),
                      ),
                      16.verticalSpace,
                      _FilterDropdown(
                        label: 'الملحقات',
                        value: _selectedAccessory,
                        items: _accessories,
                        onChanged: (value) =>
                            setState(() => _selectedAccessory = value),
                      ),
                      16.verticalSpace,
                      _FilterDropdown(
                        label: 'سعة التخزين',
                        value: _selectedStorage,
                        items: _storages,
                        onChanged: (value) =>
                            setState(() => _selectedStorage = value),
                      ),
                      16.verticalSpace,
                      _FilterDropdown(
                        label: 'وقت النشر',
                        value: _selectedPublishTime,
                        items: _publishTimes,
                        onChanged: (value) =>
                            setState(() => _selectedPublishTime = value),
                      ),
                      16.verticalSpace,
                      _FilterDropdown(
                        label: 'الترتيب',
                        value: _selectedSort,
                        items: _sortOptions,
                        onChanged: (value) =>
                            setState(() => _selectedSort = value),
                      ),
                    ],
                  ),
                ),
              ),
              16.verticalSpace,
              SizedBox(
                height: 56.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).maybePop();
                    // TODO: trigger filter action
                  },
                  child: Text(
                    'تطبيق',
                    style: AppTextStyles.poppinsTextStyle(
                      color: AppColors.white,
                      size: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RangeChip extends StatelessWidget {
  const _RangeChip({required this.label, required this.value});

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.textFieldBorderColor),
          color: AppColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              label,
              style: AppTextStyles.poppinsTextStyle(
                color: AppColors.fieldHintColor,
                size: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            6.verticalSpace,
            Text(
              '$value ل.س',
              style: AppTextStyles.poppinsTextStyle(
                color: AppColors.primaryColor,
                size: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterDropdown extends StatelessWidget {
  const _FilterDropdown({
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final String? value;
  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: AppTextStyles.poppinsTextStyle(
            color: AppColors.fieldTitleColor,
            size: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        8.verticalSpace,
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.r),
            border: Border.all(color: AppColors.textFieldBorderColor),
            color: AppColors.white,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: value,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.primaryColor,
                  size: 22.w,
                ),
                items: items
                    .map(
                      (item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: AppTextStyles.poppinsTextStyle(
                            color: AppColors.greyTextColor,
                            size: 14,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: onChanged,
                isExpanded: true,
                alignment: AlignmentDirectional.centerEnd,
                dropdownColor: AppColors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
