import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/core/resources/constants_manager.dart';
import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/ecommerce.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var token = sharedPreferences.getString(CacheConstant.token);
  String route;
  if(token == null){
    route = Routes.signInRoute;
  }else{
    route = Routes.mainLayout;
  }

  runApp(
    BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: EcommerceApp(route: route,),
    ),
  );
}
