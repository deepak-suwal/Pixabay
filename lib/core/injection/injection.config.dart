// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_assignment/config/app_config.dart' as _i3;
import 'package:flutter_assignment/core/injection/register_module.dart' as _i11;
import 'package:flutter_assignment/core/network/dio_client.dart' as _i4;
import 'package:flutter_assignment/features/favourite/presentation/bloc/favourite_cubit.dart'
    as _i5;
import 'package:flutter_assignment/features/search/data/repository/search_repository.dart'
    as _i7;
import 'package:flutter_assignment/features/search/domain/controller/i_search_controller.dart'
    as _i9;
import 'package:flutter_assignment/features/search/domain/repository/i_search_repository.dart'
    as _i6;
import 'package:flutter_assignment/features/search/presentation/bloc/search_bloc.dart'
    as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.AppConfig>(() => _i3.AppConfig());
    gh.singleton<_i4.DioClient>(registerModule.dioClient);
    gh.factory<_i5.FavoriteCubit>(() => _i5.FavoriteCubit());
    gh.factory<_i6.ISearchRepository>(
        () => _i7.SearchRepository(gh<_i4.DioClient>()));
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i9.ISearchController>(
        () => _i9.SearchController(gh<_i6.ISearchRepository>()));
    gh.factory<_i10.SearchBloc>(
        () => _i10.SearchBloc(gh<_i9.ISearchController>()));
    return this;
  }
}

class _$RegisterModule extends _i11.RegisterModule {}
