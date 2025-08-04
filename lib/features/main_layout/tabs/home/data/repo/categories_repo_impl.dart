import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/app_exception.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/data/data_source/categories_remote_data_source.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/data/models/category.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/domain/repo/categories_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo{

  final CategoriesRemoteDataSource dataSource;
  @factoryMethod
  const CategoriesRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Category>>> getCategories() async{
    try{
      final response = await dataSource.getCategories();
      return Right(response.category);
    }on AppException catch(e){
      return Left(Failure(message: e.message));
    }
  }

}