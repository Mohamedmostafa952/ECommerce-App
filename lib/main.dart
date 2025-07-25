import 'package:e_commerce_app/core/di/di.dart';
import 'package:e_commerce_app/ecommerce.dart';
import 'package:e_commerce_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  configureDependencies();
  runApp(
    BlocProvider(
      create: (context) => getIt<AuthCubit>(),
      child: EcommerceApp(),
    ),
  );
}
