import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/error/app_exception.dart';
import 'package:e_commerce_app/core/resources/constants_manager.dart';
import 'package:e_commerce_app/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:e_commerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:e_commerce_app/features/auth/data/models/LoginResponse.dart';
import 'package:e_commerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:e_commerce_app/features/auth/data/models/RegisterResponse.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource implements AuthRemoteDataSource {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  @override
  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      final response = await _dio.post(
        ApiConstants.registerEndPoint,
        data: request.toJson(),
      );

      return RegisterResponse.fromJson(response.data);
    } on DioException catch (e) {
      String message = e.response?.data["message"];
      throw RemoteException(message: message);
    }
  }

  @override
  Future<LoginResponse> login(LoginRequest request) async {
    try {
      final response = await _dio.post(
        ApiConstants.loginEndPoint,
        data: request.toJson(),
      );
      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      String message = e.response?.data["message"];
      throw RemoteException(message: message);
    }
  }
}
