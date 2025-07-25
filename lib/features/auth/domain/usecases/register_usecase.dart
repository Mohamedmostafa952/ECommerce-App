import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:e_commerce_app/features/auth/data/models/User.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class RegisterUseCase{
  AuthRepo repo;

  @factoryMethod
  RegisterUseCase({required this.repo});

  Future<Either<Failure,User>> invoke(RegisterRequest request){
    return repo.register(request);
  }
}