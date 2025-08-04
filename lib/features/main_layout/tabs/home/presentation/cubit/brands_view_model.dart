import 'package:e_commerce_app/features/main_layout/tabs/home/domain/usecases/get_brands_use_case.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/presentation/cubit_states/brands_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class BrandsViewModel extends Cubit<BrandsStates> {
  @factoryMethod
  BrandsViewModel({required this.useCase}) : super(BrandsInitialStates());

  GetBrandsUseCase useCase;

  void loadBrands() async {
    emit(BrandsLoadingState());
    var result = await useCase.invoke();
    result.fold(
      (failure) {
        emit(BrandsErrorState(errorMsg: failure.message));
      },
      (brands) {
        emit(BrandsSuccessState(brands: brands));
      },
    );
  }
}
