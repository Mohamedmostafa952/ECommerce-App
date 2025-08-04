import 'dart:async';
import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/core/widgets/product_card.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/presentation/cubit/brands_view_model.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/presentation/cubit/categories_view_model.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/presentation/cubit_states/brands_states.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/presentation/cubit_states/categories_states.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/presentation/widgets/custom_ads_widget.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/presentation/widgets/custom_brand_widget.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/presentation/widgets/custom_category_widget.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/presentation/widgets/custom_section_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  CategoriesViewModel viewModel = getIt<CategoriesViewModel>();
  BrandsViewModel brandsViewModel = getIt<BrandsViewModel>();

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
    viewModel.loadCategories();
    brandsViewModel.loadBrands();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % viewModel.adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: viewModel),
        BlocProvider.value(value: brandsViewModel),
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAdsWidget(
              adsImages: viewModel.adsImages,
              currentIndex: _currentIndex,
              timer: _timer,
            ),
            SizedBox(height: 24.h,),
            CustomSectionBar(function: () {}, sectionName: 'Categories',),
            SizedBox(height: 12.h,),
            BlocBuilder<CategoriesViewModel, CategoriesStates>(
              bloc: viewModel,
              builder: (context, state){
                if(state is CategoriesLoadingState){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(state is CategoriesErrorState){
                  return Center(child: Text(state.errorMsg),);
                }
                if(state is CategoriesSuccessState){
                  return SizedBox(
                    height: 300.h,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return  CustomCategoryWidget(category: state.categories[index],);
                      },
                      itemCount: state.categories.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    ),
                  );
                }
                return SizedBox();
              },
            ),
            CustomSectionBar(function: () {}, sectionName: 'Brands',),
            SizedBox(height: 12.h,),
            BlocBuilder<BrandsViewModel, BrandsStates>(
              bloc: brandsViewModel,
              builder: (context, state){
                if(state is BrandsLoadingState){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(state is BrandsErrorState){
                  return Center(child: Text(state.errorMsg),);
                }
                if(state is BrandsSuccessState){
                  return SizedBox(
                    height: 300.h,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return  CustomBrandWidget(brand: state.brands[index],);
                      },
                      itemCount: state.brands.length,
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                    ),
                  );
                }
                return SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}

// SizedBox(height: 12.h),
// CustomSectionBar(sectionNname: 'Brands', function: () {}),
// SizedBox(
//   height: 270.h,
//   child: GridView.builder(
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (context, index) {
//       return const CustomBrandWidget();
//     },
//     itemCount: 20,
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 2,
//     ),
//   ),
// ),
// CustomSectionBar(
//   sectionNname: 'Most Selling Products',
//   function: () {},
// ),
// SizedBox(
//   child: SizedBox(
//     height: 360.h,
//     child: ListView.builder(
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (context, index) {
//         return const ProductCard(
//           title: "Nike Air Jordon",
//           description:
//               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
//           rating: 4.5,
//           price: 1100,
//           priceBeforeDiscount: 1500,
//           image: ImageAssets.categoryHomeImage,
//         );
//       },
//       itemCount: 20,
//     ),
//   ),
// ),
