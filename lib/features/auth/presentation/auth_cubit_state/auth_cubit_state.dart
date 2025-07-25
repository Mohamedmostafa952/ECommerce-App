import 'package:e_commerce_app/features/auth/data/models/User.dart';

sealed class AuthState{}
class AuthInitialState extends AuthState{}
class RegisterLoadingState extends AuthState{}
class RegisterErrorState extends AuthState{
  String errorMsg;
  RegisterErrorState({required this.errorMsg});
}
class RegisterSuccessState extends AuthState{
  User user;
  RegisterSuccessState({required this.user});
}

class LoginLoadingState extends AuthState{}
class LoginSuccessState extends AuthState{
  User user;
  LoginSuccessState({required this.user});
}
class LoginErrorState extends AuthState{
  String errorMsg;
  LoginErrorState({required this.errorMsg});
}
