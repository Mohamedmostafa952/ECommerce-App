import 'package:e_commerce_app/features/main_layout/tabs/home/data/models/brands/BrandsResponse.dart';

abstract class BrandsRemoteDataSource{
  Future<BrandsResponse> getBrands();
}