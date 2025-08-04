import 'package:e_commerce_app/features/main_layout/tabs/home/data/models/brands/brand.dart';

sealed class BrandsStates{}
class BrandsInitialStates extends BrandsStates{}
class BrandsLoadingState extends BrandsStates {}

class BrandsErrorState extends BrandsStates {
  String errorMsg;

  BrandsErrorState({required this.errorMsg});
}

class BrandsSuccessState extends BrandsStates {
  List<Brand> brands;

  BrandsSuccessState({required this.brands});
}