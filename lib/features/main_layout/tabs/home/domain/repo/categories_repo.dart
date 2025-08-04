import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/data/models/category.dart';

abstract class CategoriesRepo{
  Future<Either<Failure, List<Category>>> getCategories();
}