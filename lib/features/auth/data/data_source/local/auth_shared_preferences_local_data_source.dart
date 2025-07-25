import 'package:e_commerce_app/core/resources/constants_manager.dart';
import 'package:e_commerce_app/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: AuthLocalDataSource)
class AuthSharedPreferencesLocalDataSource implements AuthLocalDataSource{

  @override
  void saveToken(String token) async{
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString(CacheConstant.token, token);
  }

  @override
  Future<String> getToken() async{
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getString(CacheConstant.token)!;
  }

}