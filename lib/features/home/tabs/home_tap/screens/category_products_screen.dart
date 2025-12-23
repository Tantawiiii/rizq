import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_assets.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/features/home/tabs/home_tap/model/adItem.dart';
import 'package:rizq/features/home/tabs/home_tap/widgets/ad_card.dart';
import 'package:rizq/features/home/tabs/home_tap/widgets/filter_drawer.dart';
import 'package:rizq/shared_widgets/filter_button.dart';
import 'package:rizq/shared_widgets/search_field.dart';


class CategoryProductsScreen extends StatefulWidget {
  const CategoryProductsScreen({super.key, required this.initialCategory});

  final String initialCategory;

  @override
  State<CategoryProductsScreen> createState() => _CategoryProductsScreenState();
}

class _CategoryProductsScreenState extends State<CategoryProductsScreen> {
  static const Map<String, List<String>> _filtersByCategory = {
    'إلكترونيات': ['الكل', 'موبايل وتابلت', 'لابتوب', 'ثلاجات', 'تليفزيونات'],
    'ملابس': ['الكل', 'رجالي', 'نسائي', 'أطفال'],
    'عقارات': ['الكل', 'شقق', 'فلل', 'مكاتب'],
    'سيارات': ['الكل', 'سيدان', 'دفع رباعي', 'شاحنات'],
  };

  static const Map<String, List<_CategoryProduct>> _productsByCategory = {
    'إلكترونيات': [
      _CategoryProduct(
        filter: 'موبايل وتابلت',
        ad: AdItem(
          title: 'هاتف Samsung Gala S24 Ultra',
          imageAsset: AppAssets.productOnePng,
          price: '100 رس',
          oldPrice: '250 رس',
          discount: '-65%',
        ),
      ),
      _CategoryProduct(
        filter: 'موبايل وتابلت',
        ad: AdItem(
          title: 'ساعة آبل ووتش سيريس 9',
          imageAsset: AppAssets.productTwoPng,
          price: '100 رس',
          oldPrice: '250 رس',
          discount: '-65%',
        ),
      ),
      _CategoryProduct(
        filter: 'لابتوب',
        ad: AdItem(
          title: 'أبل ماك بوك إير 15" مع شريحة M2',
          imageAsset: AppAssets.productOnePng,
          price: '100 رس',
          oldPrice: '250 رس',
          discount: '-65%',
        ),
      ),
      _CategoryProduct(
        filter: 'تليفزيونات',
        ad: AdItem(
          title: 'شاشة سامسونج QLED 65 بوصة',
          imageAsset: AppAssets.productTwoPng,
          price: '260 رس',
          oldPrice: '520 رس',
          discount: '-50%',
        ),
      ),
      _CategoryProduct(
        filter: 'ثلاجات',
        ad: AdItem(
          title: 'ثلاجة إل جي الذكية 18 قدم',
          imageAsset: AppAssets.productOnePng,
          price: '300 رس',
          oldPrice: '600 رس',
          discount: '-50%',
        ),
      ),
    ],
    'ملابس': [
      _CategoryProduct(
        filter: 'نسائي',
        ad: AdItem(
          title: 'فستان بني قصير',
          imageAsset: AppAssets.productOnePng,
          price: '100 رس',
          oldPrice: '250 رس',
          discount: '-65%',
        ),
      ),
      _CategoryProduct(
        filter: 'نسائي',
        ad: AdItem(
          title: 'فستان صيفي أزرق',
          imageAsset: AppAssets.productTwoPng,
          price: '80 رس',
          oldPrice: '200 رس',
          discount: '-60%',
        ),
      ),
      _CategoryProduct(
        filter: 'رجالي',
        ad: AdItem(
          title: 'بدلة رسمية رجالية',
          imageAsset: AppAssets.productOnePng,
          price: '150 رس',
          oldPrice: '300 رس',
          discount: '-50%',
        ),
      ),
    ],
    'عقارات': [
      _CategoryProduct(
        filter: 'شقق',
        ad: AdItem(
          title: 'شقة فاخرة 4 غرف',
          imageAsset: AppAssets.productTwoPng,
          price: '3500 رس',
          oldPrice: '5000 رس',
          discount: '-30%',
        ),
      ),
      _CategoryProduct(
        filter: 'فلل',
        ad: AdItem(
          title: 'فيلا حديثة بحديقة',
          imageAsset: AppAssets.productOnePng,
          price: '7500 رس',
          oldPrice: '9000 رس',
          discount: '-15%',
        ),
      ),
    ],
    'سيارات': [
      _CategoryProduct(
        filter: 'سيدان',
        ad: AdItem(
          title: 'تويوتا كامري 2023',
          imageAsset: AppAssets.productOnePng,
          price: '60000 رس',
          oldPrice: '70000 رس',
          discount: '-14%',
        ),
      ),
      _CategoryProduct(
        filter: 'دفع رباعي',
        ad: AdItem(
          title: 'جيب رانجلر 2022',
          imageAsset: AppAssets.productTwoPng,
          price: '120000 رس',
          oldPrice: '135000 رس',
          discount: '-11%',
        ),
      ),
    ],
  };

  final TextEditingController _searchController = TextEditingController();

  late final List<String> _filters;
  late final List<_CategoryProduct> _allProducts;
  late String _selectedFilter;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filters = _filtersByCategory[widget.initialCategory] ?? const ['all'];
    _selectedFilter = _filters.first;
    _allProducts = _productsByCategory[widget.initialCategory] ?? const [];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      endDrawer: const FilterDrawer(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(context),
              24.verticalSpace,
              _buildSearchRow(),
              16.verticalSpace,
              _buildFilterChips(),
              24.verticalSpace,
              Expanded(
                child: SingleChildScrollView(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final spacing = 16.w;
                      final cardWidth = (constraints.maxWidth - spacing) / 2;
                      final items = _filteredProducts;

                      if (items.isEmpty) {
                        return Padding(
                          padding: EdgeInsets.only(top: 48.h),
                          child: Center(
                            child: Text(
                              'dummy text',
                              style: AppTextStyles.cairoTextStyle(
                                color: AppColors.greyTextColor,
                                size: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }

                      return Wrap(
                        spacing: spacing,
                        runSpacing: 16.h,
                        children: items
                            .map(
                              (item) => SizedBox(
                                width: cardWidth,
                                child: AdCard(item: item),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Navigator.of(context).maybePop(),
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20.w,
            color: AppColors.primaryColor,
          ),
        ),
        Expanded(
          child: Text(
            widget.initialCategory,
            textAlign: TextAlign.center,
            style: AppTextStyles.cairoTextStyle(
              color: AppColors.primaryColor,
              size: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(width: 48.w),
      ],
    );
  }

  Widget _buildSearchRow() {
    return Row(
      children: [
        Expanded(
          child: SearchField(
            controller: _searchController,
            onChanged: (value) => setState(() => _searchQuery = value.trim()),
          ),
        ),
        8.horizontalSpace,
        const FilterButton(),
      ],
    );
  }

  Widget _buildFilterChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _filters
            .map(
              (filter) => Padding(
                padding: EdgeInsetsDirectional.only(end: 8.w),
                child: GestureDetector(
                  onTap: () => setState(() => _selectedFilter = filter),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: _selectedFilter == filter
                          ? AppColors.primaryColor
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: _selectedFilter == filter
                            ? AppColors.primaryColor
                            : AppColors.textFieldBorderColor,
                      ),
                    ),
                    child: Text(
                      filter,
                      style: AppTextStyles.cairoTextStyle(
                        color: _selectedFilter == filter
                            ? AppColors.white
                            : AppColors.primaryColor,
                        size: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  List<AdItem> get _filteredProducts {
    return _allProducts
        .where(
          (item) => _selectedFilter == 'all' || item.filter == _selectedFilter,
        )
        .where(
          (item) =>
              _searchQuery.isEmpty ||
              item.ad.title.toLowerCase().contains(_searchQuery.toLowerCase()),
        )
        .map((item) => item.ad)
        .toList();
  }
}

class _CategoryProduct {
  const _CategoryProduct({required this.filter, required this.ad});

  final String filter;
  final AdItem ad;
}

