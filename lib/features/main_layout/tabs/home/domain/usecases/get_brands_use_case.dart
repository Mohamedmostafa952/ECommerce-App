
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/data/models/brands/brand.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/domain/repo/brands_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetBrandsUseCase{

  final BrandsRepo repo;
  @factoryMethod
  const GetBrandsUseCase({required this.repo});

  Future<Either<Failure, List<Brand>>> invoke(){
    return repo.getBrands();
  }
}
