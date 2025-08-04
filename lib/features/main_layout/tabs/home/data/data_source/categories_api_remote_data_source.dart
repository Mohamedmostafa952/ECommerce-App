import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/error/app_exception.dart';
import 'package:e_commerce_app/core/resources/constants_manager.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/data/data_source/categories_remote_data_source.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/data/models/CategoriesResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoriesRemoteDataSource)
class CategoriesApiRemoteDataSource implements CategoriesRemoteDataSource {
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  @override
  Future<CategoriesResponse> getCategories() async {
    try {
      final response = await _dio.get(ApiConstants.categoriesEndPoint);
      return CategoriesResponse.fromJson(response.data);
    } on DioException catch (e) {
      String? message = e.response!.data['message'];
      throw RemoteException(message: message ?? "Failed to load categories");
    }
  }
}
