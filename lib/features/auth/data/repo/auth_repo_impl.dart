import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/app_exception.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:e_commerce_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:e_commerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:e_commerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:e_commerce_app/features/auth/data/models/User.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;


  @factoryMethod
  AuthRepoImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
  });

  @override
  Future<Either<Failure, User>> register(RegisterRequest request) async {
    try {
      final response = await authRemoteDataSource.register(request);
      authLocalDataSource.saveToken(response.token);
      return Right(response.user);
    } on AppException catch (e) {
      return Left(Failure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, User>> login(LoginRequest request) async {
    try {
      final response = await authRemoteDataSource.login(request);
      authLocalDataSource.getToken();
      return Right(response.user);
    } on AppException catch (e) {
      return Left(Failure(message: e.message));
    }
  }
}
