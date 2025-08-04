// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i755;
import '../../features/auth/data/data_source/local/auth_shared_preferences_local_data_source.dart'
    as _i167;
import '../../features/auth/data/data_source/remote/auth_api_remote_data_source.dart'
    as _i81;
import '../../features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i548;
import '../../features/auth/data/repo/auth_repo_impl.dart' as _i984;
import '../../features/auth/domain/repo/auth_repo.dart' as _i170;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/register_usecase.dart' as _i941;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import '../../features/main_layout/presentation/cubit/main_layout_view_model.dart'
    as _i152;
import '../../features/main_layout/tabs/home/data/data_source/brands_api_remote_data_source.dart'
    as _i130;
import '../../features/main_layout/tabs/home/data/data_source/brands_remote_data_source.dart'
    as _i367;
import '../../features/main_layout/tabs/home/data/data_source/categories_api_remote_data_source.dart'
    as _i362;
import '../../features/main_layout/tabs/home/data/data_source/categories_remote_data_source.dart'
    as _i760;
import '../../features/main_layout/tabs/home/data/repo/brands_repo_impl.dart'
    as _i390;
import '../../features/main_layout/tabs/home/data/repo/categories_repo_impl.dart'
    as _i565;
import '../../features/main_layout/tabs/home/domain/repo/brands_repo.dart'
    as _i1032;
import '../../features/main_layout/tabs/home/domain/repo/categories_repo.dart'
    as _i369;
import '../../features/main_layout/tabs/home/domain/usecases/get_brands_use_case.dart'
    as _i517;
import '../../features/main_layout/tabs/home/domain/usecases/get_categories_use_case.dart'
    as _i1072;
import '../../features/main_layout/tabs/home/presentation/cubit/brands_view_model.dart'
    as _i443;
import '../../features/main_layout/tabs/home/presentation/cubit/categories_view_model.dart'
    as _i166;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i152.MainLayoutViewModel>(() => _i152.MainLayoutViewModel());
    gh.factory<_i548.AuthRemoteDataSource>(
      () => _i81.AuthApiRemoteDataSource(),
    );
    gh.factory<_i367.BrandsRemoteDataSource>(
      () => _i130.BrandsApiRemoteDataSource(),
    );
    gh.factory<_i760.CategoriesRemoteDataSource>(
      () => _i362.CategoriesApiRemoteDataSource(),
    );
    gh.factory<_i369.CategoriesRepo>(
      () => _i565.CategoriesRepoImpl(
        dataSource: gh<_i760.CategoriesRemoteDataSource>(),
      ),
    );
    gh.factory<_i755.AuthLocalDataSource>(
      () => _i167.AuthSharedPreferencesLocalDataSource(),
    );
    gh.factory<_i170.AuthRepo>(
      () => _i984.AuthRepoImpl(
        authRemoteDataSource: gh<_i548.AuthRemoteDataSource>(),
        authLocalDataSource: gh<_i755.AuthLocalDataSource>(),
      ),
    );
    gh.factory<_i1032.BrandsRepo>(
      () =>
          _i390.BrandsRepoImpl(dataSource: gh<_i367.BrandsRemoteDataSource>()),
    );
    gh.factory<_i517.GetBrandsUseCase>(
      () => _i517.GetBrandsUseCase(repo: gh<_i1032.BrandsRepo>()),
    );
    gh.factory<_i1072.GetCategoriesUseCase>(
      () => _i1072.GetCategoriesUseCase(repo: gh<_i369.CategoriesRepo>()),
    );
    gh.factory<_i443.BrandsViewModel>(
      () => _i443.BrandsViewModel(useCase: gh<_i517.GetBrandsUseCase>()),
    );
    gh.factory<_i166.CategoriesViewModel>(
      () => _i166.CategoriesViewModel(
        categoriesUseCase: gh<_i1072.GetCategoriesUseCase>(),
      ),
    );
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(repo: gh<_i170.AuthRepo>()),
    );
    gh.factory<_i941.RegisterUseCase>(
      () => _i941.RegisterUseCase(repo: gh<_i170.AuthRepo>()),
    );
    gh.factory<_i117.AuthCubit>(
      () => _i117.AuthCubit(
        registerUseCase: gh<_i941.RegisterUseCase>(),
        loginUseCase: gh<_i188.LoginUseCase>(),
      ),
    );
    return this;
  }
}
