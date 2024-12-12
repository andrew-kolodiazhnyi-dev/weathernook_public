// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_remote_config/firebase_remote_config.dart' as _i627;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:logger/logger.dart' as _i974;
import 'package:package_info_plus/package_info_plus.dart' as _i655;

import '../../api/api_client.dart' as _i502;
import '../../common/cubit/app_control/app_control_cubit.dart' as _i188;
import '../../common/services/api_service/data/weather_api_service.dart'
    as _i737;
import '../../common/services/api_service/domain/api_service.dart' as _i823;
import '../../common/services/storage_service/data/local_storage_service.dart'
    as _i587;
import '../../common/services/storage_service/domain/storage_service.dart'
    as _i6;
import '../../features/app_update/app_update_service/data/firebase_app_update_service.dart'
    as _i339;
import '../../features/pages/home_page/cubit/home_page_cubit.dart' as _i220;
import '../../features/pages/search_page/cubit/search_page_cubit.dart' as _i367;
import '../../features/pages/settings_page/cubit/settings_page_cubit.dart'
    as _i165;
import '../router/app_router.dart' as _i81;
import '../router/router.dart' as _i285;
import 'modules/api_module.dart' as _i145;
import 'modules/auto_router_module.dart' as _i448;
import 'modules/firebase_module.dart' as _i398;
import 'modules/logger_module.dart' as _i205;
import 'modules/package_info.dart' as _i726;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final autoRouterModule = _$AutoRouterModule();
    final loggerModule = _$LoggerModule();
    final packageInfoModule = _$PackageInfoModule();
    final apiModule = _$ApiModule();
    final firebaseModule = _$FirebaseModule();
    gh.singleton<_i81.AppRouter>(() => autoRouterModule.appAutoRouter());
    gh.singleton<_i974.Logger>(() => loggerModule.logger());
    await gh.singletonAsync<_i655.PackageInfo>(
      () => packageInfoModule.appAutoRouter(),
      preResolve: true,
    );
    gh.lazySingleton<_i502.ApiClient>(() => apiModule.apiClient());
    await gh.singletonAsync<_i6.StorageService>(
      () => _i587.LocalStorageService.getInstance(),
      preResolve: true,
      dispose: (i) => i.dispose(),
    );
    gh.singleton<_i339.FirebaseAppUpdateService>(() =>
        _i339.FirebaseAppUpdateService(packageInfo: gh<_i655.PackageInfo>()));
    gh.singleton<_i285.Router>(() => _i285.Router(gh<_i81.AppRouter>()));
    gh.singleton<_i188.AppControlCubit>(
        () => _i188.AppControlCubit(gh<_i6.StorageService>()));
    gh.factory<_i823.ApiService>(() => _i737.WeatherApiService(
          gh<_i502.ApiClient>(),
          gh<_i6.StorageService>(),
        ));
    await gh.singletonAsync<_i627.FirebaseRemoteConfig>(
      () => firebaseModule
          .firebaseRemoteConfig(gh<_i339.FirebaseAppUpdateService>()),
      preResolve: true,
    );
    gh.factory<_i220.HomePageCubit>(() => _i220.HomePageCubit(
          gh<_i823.ApiService>(),
          gh<_i6.StorageService>(),
        ));
    gh.singleton<_i165.SettingsPageCubit>(() => _i165.SettingsPageCubit(
          gh<_i823.ApiService>(),
          gh<_i6.StorageService>(),
        ));
    gh.factory<_i367.SearchPageCubit>(
        () => _i367.SearchPageCubit(gh<_i823.ApiService>()));
    return this;
  }
}

class _$AutoRouterModule extends _i448.AutoRouterModule {}

class _$LoggerModule extends _i205.LoggerModule {}

class _$PackageInfoModule extends _i726.PackageInfoModule {}

class _$ApiModule extends _i145.ApiModule {}

class _$FirebaseModule extends _i398.FirebaseModule {}
