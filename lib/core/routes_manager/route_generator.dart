import 'package:e_commerce_app/core/routes_manager/routes.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/sign_in.dart';
import 'package:e_commerce_app/features/auth/presentation/screens/sign_up.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
      switch(settings.name){
        case Routes.signInRoute:
          return MaterialPageRoute(builder: (_) => SignInScreen());
        case Routes.signUpRoute:
          return MaterialPageRoute(builder: (_) => SignUpScreen());
        default:
          return unDefinedRoute();
      }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}