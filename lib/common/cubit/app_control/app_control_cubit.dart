import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/di/locator.dart';
import '../../../core/themes/weathernook_theme_mode.dart';
import '../../services/storage_service/domain/storage_service.dart';
import '../base_cubit.dart';

part 'app_control_state.dart';

@singleton
class AppControlCubit extends BaseCubit<AppControlState> {
  final StorageService _storageService;

  AppControlCubit(
    this._storageService,
  ) : super(
          initialState: AppControlState(
            status: AppControlStatus.idle,
            themeMode: _storageService.getTheme(),
          ),
        ) {
    locator<PackageInfo>().version;
  }

  @override
  void handleError(String message) {
    emit(
      state.copyWith(
        status: AppControlStatus.error,
        errorMessage: Option.of(message),
      ),
    );
  }

  Future<void> setTheme(WeathernookThemeMode themeMode) async {
    await _storageService.setTheme(themeMode);
    emit(state.copyWith(themeMode: themeMode));
  }
}
