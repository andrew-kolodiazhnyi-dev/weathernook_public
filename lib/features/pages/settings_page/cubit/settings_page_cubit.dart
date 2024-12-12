import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/cubit/base_cubit.dart';
import '../../../../common/services/api_service/domain/api_service.dart';
import '../../../../common/services/storage_service/domain/storage_service.dart';
import 'settings_page_state.dart';

@singleton
class SettingsPageCubit extends BaseCubit<SettingsPageState> {
  final ApiService _apiService;
  final StorageService _storageService;

  SettingsPageCubit(
    this._apiService,
    this._storageService,
  ) : super(
          initialState:
              const SettingsPageState(status: SettingsPageStatus.idle),
        );

  void tryKey(String apiKey) async {
    await makeCall(
      () async {
        await _apiService.tryApiKey(apiKey);
      },
      errorHandler: (e) {
        /// Error code 2008 means that the API KEY is not valid
        if (e.statusCode != 403 && e.error.code != 2008) {
          _storageService.setExternalApiKey(apiKey);
          emit(state.copyWith(status: SettingsPageStatus.success));
        } else {
          emit(
            state.copyWith(
              status: SettingsPageStatus.error,
              errorMessage: Option.of(e.toString()),
            ),
          );
        }
      },
    );
  }

  @override
  void handleError(String message) {
    emit(
      state.copyWith(
        status: SettingsPageStatus.error,
        errorMessage: Option.of(message),
      ),
    );
  }
}
