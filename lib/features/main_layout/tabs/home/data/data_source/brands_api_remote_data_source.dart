import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/error/app_exception.dart';
import 'package:e_commerce_app/core/resources/constants_manager.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/data/data_source/brands_remote_data_source.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/data/models/brands/BrandsResponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRemoteDataSource)
class BrandsApiRemoteDataSource implements BrandsRemoteDataSource{
  
  final Dio _dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
  @override
  Future<BrandsResponse> getBrands() async{
    try{
      final response = await _dio.get(ApiConstants.brandsEndPoint);
      return BrandsResponse.fromJson(response.data);
    }on DioException catch(e){
      String? message = e.response!.data['message'];
      throw RemoteException(message: message ?? "Failed to load categories");
    }
  }
  
}