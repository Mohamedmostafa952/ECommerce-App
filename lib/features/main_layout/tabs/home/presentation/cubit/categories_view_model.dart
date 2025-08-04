import 'package:e_commerce_app/core/resources/assets_manager.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/domain/usecases/get_brands_use_case.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/domain/usecases/get_categories_use_case.dart';
import 'package:e_commerce_app/features/main_layout/tabs/home/presentation/cubit_states/categories_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoriesViewModel extends Cubit<CategoriesStates> {
  @factoryMethod
  CategoriesViewModel({required this.categoriesUseCase})
    : super(CategoriesInitialState());

  List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  GetCategoriesUseCase categoriesUseCase;

  void loadCategories() async {
    emit(CategoriesLoadingState());
    var result = await categoriesUseCase.invoke();
    result.fold(
      (failure) {
        emit(CategoriesErrorState(errorMsg: failure.message));
      },
      (categories) {
        emit(CategoriesSuccessState(categories: categories));
      },
    );
  }
}
