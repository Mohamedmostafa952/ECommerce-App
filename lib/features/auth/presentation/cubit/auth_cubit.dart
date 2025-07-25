import 'package:e_commerce_app/features/auth/data/models/LoginRequest.dart';
import 'package:e_commerce_app/features/auth/data/models/RegisterRequest.dart';
import 'package:e_commerce_app/features/auth/domain/repo/auth_repo.dart';
import 'package:e_commerce_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:e_commerce_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:e_commerce_app/features/auth/presentation/auth_cubit_state/auth_cubit_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {

  @factoryMethod
  AuthCubit({required this.registerUseCase, required this.loginUseCase}) : super(AuthInitialState());

  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;

  void register(RegisterRequest request) async {
    emit(RegisterLoadingState());
    var result = await registerUseCase.invoke(request);
    result.fold(
      (error) {
        emit(RegisterErrorState(errorMsg: error.message));
      },
      (user) {
        emit(RegisterSuccessState(user: user));
      },
    );
  }

  void login(LoginRequest request) async {
    emit(LoginLoadingState());
    var result = await loginUseCase.invoke(request);
    result.fold(
      (error) {
        emit(LoginErrorState(errorMsg: error.message));
      },
      (user) {
        emit(LoginSuccessState(user: user));
      },
    );
  }
}
