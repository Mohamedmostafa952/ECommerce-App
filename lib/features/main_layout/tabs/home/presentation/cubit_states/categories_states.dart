import 'package:e_commerce_app/features/main_layout/tabs/home/data/models/brands/brand.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/data/models/category.dart';

sealed class CategoriesStates {}

class CategoriesInitialState extends CategoriesStates {}

class CategoriesLoadingState extends CategoriesStates {}

class CategoriesErrorState extends CategoriesStates {
  String errorMsg;

  CategoriesErrorState({required this.errorMsg});
}

class CategoriesSuccessState extends CategoriesStates {
  List<Category> categories;

  CategoriesSuccessState({required this.categories});
}


