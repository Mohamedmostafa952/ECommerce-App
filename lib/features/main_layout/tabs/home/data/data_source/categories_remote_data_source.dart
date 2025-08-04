import 'package:e_commerce_app/features/main_layout/tabs/home/data/models/CategoriesResponse.dart';

abstract class CategoriesRemoteDataSource{
  Future<CategoriesResponse> getCategories();
}