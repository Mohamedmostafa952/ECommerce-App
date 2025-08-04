import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/data/models/brands/brand.dart';

abstract class BrandsRepo{
  Future<Either<Failure, List<Brand>>> getBrands();
}