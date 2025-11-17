import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constant/app_colors.dart';
import 'widgets/home_bottom_navigation.dart';
import 'tabs/home_tap/widgets/filter_drawer.dart';
import 'tabs/add_ad_tab.dart';
import 'tabs/home_tap/screens/home_tab.dart';
import 'tabs/profile_tap/screens/profile_tab.dart';
import 'tabs/my_ads_tap/my_ads_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _isNavCollapsed = false;
  int _selectedIndex = 3;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  void _handleScroll() {
    if (_selectedIndex != 3) {
      return;
    }
    final hasClients = _scrollController.hasClients;
    final bool shouldCollapse = hasClients && _scrollController.offset > 80.h;

    if (shouldCollapse != _isNavCollapsed) {
      setState(() {
        _isNavCollapsed = shouldCollapse;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
      if (index != 3) {
        _isNavCollapsed = false;
      }
    });
  }

  void _onAddPressed() => _onItemSelected(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      endDrawer: const FilterDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: _buildTabContent(),
            ),
            Positioned(
              left: 24.w,
              right: 24.w,
              bottom: 16.h,
              child: HomeBottomNavigation(
                isCollapsed: _isNavCollapsed,
                selectedIndex: _selectedIndex,
                onItemSelected: _onItemSelected,
                onAddPressed: _onAddPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedIndex) {
      case 0:
        return _buildProfileTab();
      case 1:
        return _buildAddAdTab();
      case 2:
        return _buildTasksTab();
      case 3:
      default:
        return _buildHomeTab();
    }
  }

  Widget _buildHomeTab() {
    return HomeTab(scrollController: _scrollController);
  }

  Widget _buildProfileTab() {
    return const ProfileTab(key: ValueKey('profile_tab'));
  }

  Widget _buildAddAdTab() {
    return const AddAdTab(key: ValueKey('add_tab'));
  }

  Widget _buildTasksTab() {
    return const TasksTab(key: ValueKey('tasks_tab'));
  }
}
