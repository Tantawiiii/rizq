import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:rizq/features/chat/ui/screens/chat_list_screen.dart';
import 'package:rizq/features/home/tabs/create_ad_tab/ui/screens/categories_screen.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/normal/normal_profile_tab.dart';
import 'package:rizq/features/home/tabs/profile_tap/ui/seller/seller_profile_tab.dart';


import '../../core/constant/app_assets.dart';
import '../../core/constant/app_colors.dart';
import 'tabs/home_tap/widgets/filter_drawer.dart';
import 'tabs/home_tap/screens/home_tab.dart';
import 'tabs/my_ads_tap/my_ads_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PersistentTabController _controller = PersistentTabController(
    initialIndex: 0,
  );
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
    _controller.addListener(_onTabChanged);
  }

  void _onTabChanged() {
    setState(() {});
  }

  void _handleScroll() {
    if (_controller.index != 3) {
      return;
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _controller.removeListener(_onTabChanged);
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      endDrawer: const FilterDrawer(),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardAppears: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(24.r),
          colorBehindNavBar: Colors.white,
        ),
        popBehaviorOnSelectedNavBarItemPress: PopBehavior.all,
        animationSettings: const NavBarAnimationSettings(),
        navBarStyle: NavBarStyle.style16,
        navBarHeight: 70.h,
        margin: EdgeInsets.symmetric(vertical: 2.h),
      ),
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomeTab(scrollController: _scrollController),
      const TasksTab(),
      const CategoriesScreen(),
      const ChatListScreen(),
      const SellerProfileTab()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppAssets.homeSvg,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            _controller.index == 0
                ? AppColors.sconderyColor
                : AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        inactiveIcon: SvgPicture.asset(
          AppAssets.homeSvg,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        title: "",
        activeColorPrimary: AppColors.sconderyColor,
        inactiveColorPrimary: AppColors.primaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppAssets.adsSvg,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            _controller.index == 1
                ? AppColors.primaryColor
                : AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        inactiveIcon: SvgPicture.asset(
          AppAssets.adsSvg,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        title: "",
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.primaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: Center(
          child: Icon(Icons.add, color: AppColors.white, size: 24.sp),
        ),
        inactiveIcon: Center(
          child: Container(
            height: 90.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.sconderyColor,
            ),
            child: Icon(Icons.add, color: AppColors.white, size: 24.sp),
          ),
        ),
        title: "",
        activeColorPrimary: AppColors.sconderyColor,
        inactiveColorPrimary: AppColors.sconderyColor,
        onPressed: (context) {
          _controller.jumpToTab(2);
        },
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppAssets.chatSvg,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            _controller.index == 3
                ? AppColors.primaryColor
                : AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        inactiveIcon: SvgPicture.asset(
          AppAssets.chatSvg,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        title: "",
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.primaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AppAssets.userSvg,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            _controller.index == 4
                ? AppColors.primaryColor
                : AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        inactiveIcon: SvgPicture.asset(
          AppAssets.userSvg,
          width: 24.w,
          height: 24.h,
          colorFilter: ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        title: "",
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.primaryColor,
      ),
    ];
  }
}
