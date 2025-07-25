import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:e_commerce_app/features/auth/data/models/User.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase{
  AuthRepo repo;

  @factoryMethod
  LoginUseCase({required this.repo});

  Future<Either<Failure, User>> invoke(LoginRequest request){
    return repo.login(request);
  }
}