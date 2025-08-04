import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/data/models/category.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/domain/repo/categories_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase{
  final CategoriesRepo repo;

  @factoryMethod
  const GetCategoriesUseCase({required this.repo});

  Future<Either<Failure, List<Category>>> invoke(){
    return repo.getCategories();
  }
}