import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/app_exception.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/data/data_source/brands_remote_data_source.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/data/models/brands/brand.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/domain/repo/brands_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepo)
class BrandsRepoImpl implements BrandsRepo{

  final BrandsRemoteDataSource dataSource;
  @factoryMethod
  BrandsRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<Brand>>> getBrands() async{
    try{
      final result = await dataSource.getBrands();
      return Right(result.brands);
    }on AppException catch(e){
      return Left(Failure(message: e.message));
    }
  }


}