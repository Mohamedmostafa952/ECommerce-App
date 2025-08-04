import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:e_commerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:e_commerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:e_commerce_app/features/auth/data/models/User.dart';
import 'package:e_commerce_app/features/auth/domain/entities/login_request_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, User>> register(RegisterRequest request);

  Future<Either<Failure, User>> login(LoginRequest request);
}
