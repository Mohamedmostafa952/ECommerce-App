import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/resources/colors_manager.dart';
import 'package:e_commerce_app/core/widgets/home_screen_app_bar.dart';
import 'package:e_commerce_app/features/main_layout/presentation/cubit/main_layout_view_model.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {

  MainLayoutViewModel viewModel = getIt<MainLayoutViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (context, state){
        return Scaffold(
          backgroundColor: ColorManager.white,
          appBar: viewModel.selectedIndex == 0 || viewModel.selectedIndex == 1
              ? const HomeScreenAppBar()
              : AppBar(
            automaticallyImplyLeading: false,
            title: SvgPicture.asset(
              SvgAssets.routeLogo,
              height: 25.h,
              width: 25.w,
              colorFilter: const ColorFilter.mode(
                ColorManager.textColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          extendBody: false,
          body: viewModel.tabs[viewModel.selectedIndex],
          bottomNavigationBar: buildBottomNavBar(),
        );
      },
    );
  }

  Widget buildBottomNavBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r),
      ),
      child: BottomNavigationBar(
        backgroundColor: ColorManager.primary,
        type: BottomNavigationBarType.fixed,
        onTap: viewModel.onBottomNavBarItemTap,
        currentIndex: viewModel.selectedIndex,
        elevation: 0,
        selectedItemColor: ColorManager.primary,
        unselectedItemColor: ColorManager.white,
        showSelectedLabels: false,
        // Hide selected item labels
        showUnselectedLabels: false,
        items: [
          _buildBottomNavBarItem(
            iconPath: IconsAssets.icHome,
            title: "home",
            isSelected: viewModel.selectedIndex == 0,
          ),
          _buildBottomNavBarItem(
            iconPath: IconsAssets.icCategory,
            title: "category",
            isSelected: viewModel.selectedIndex == 1,
          ),
          _buildBottomNavBarItem(
            iconPath: IconsAssets.icWithList,
            title: "WishList",
            isSelected: viewModel.selectedIndex == 2,
          ),
          _buildBottomNavBarItem(
            iconPath: IconsAssets.icProfile,
            title: "profile",
            isSelected: viewModel.selectedIndex == 3,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavBarItem({
    required String iconPath,
    required String title,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: CircleAvatar(
        radius: 25.r,
        backgroundColor: isSelected ? ColorManager.white : ColorManager.primary,
        child: ImageIcon(
          AssetImage(iconPath),
          color: isSelected ? ColorManager.primary : ColorManager.white,
        ),
      ),
      label: title,
    );
  }
}
