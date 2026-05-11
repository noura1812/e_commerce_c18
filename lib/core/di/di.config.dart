// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_source/auth_data_source.dart' as _i364;
import '../../features/auth/data/repo/auth_repo_impl.dart' as _i984;
import '../../features/auth/domain/repository/auth_repo.dart' as _i976;
import '../../features/auth/domain/usecase/login_usecase.dart' as _i911;
import '../../features/auth/domain/usecase/sign_up_usecase.dart' as _i134;
import '../../features/auth/presentation/cubit/auth_cubit.dart' as _i117;
import 'model.network_dependency.dart' as _i867;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final networkDependency = _$NetworkDependency();
    gh.factory<_i361.Dio>(() => networkDependency.dio);
    gh.factory<_i364.AuthDataSource>(
      () => _i364.AuthNetworkDataSource(dio: gh<_i361.Dio>()),
    );
    gh.factory<_i976.AuthRepo>(
      () => _i984.AuthRepoImpl(authDataSource: gh<_i364.AuthDataSource>()),
    );
    gh.factory<_i911.LoginUsecase>(
      () => _i911.LoginUsecase(authRepo: gh<_i976.AuthRepo>()),
    );
    gh.factory<_i134.SignUpUsecase>(
      () => _i134.SignUpUsecase(authRepo: gh<_i976.AuthRepo>()),
    );
    gh.factory<_i117.AuthCubit>(
      () =>
          _i117.AuthCubit(gh<_i911.LoginUsecase>(), gh<_i134.SignUpUsecase>()),
    );
    return this;
  }
}

class _$NetworkDependency extends _i867.NetworkDependency {}
