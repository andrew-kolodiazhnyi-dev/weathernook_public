import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/cubit/base_cubit.dart';
import '../../../../common/services/api_service/domain/api_service.dart';
import '../../../../common/services/storage_service/domain/storage_service.dart';
import 'home_page_state.dart';

@injectable
class HomePageCubit extends BaseCubit<HomePageState> {
  final ApiService _apiService;
  final StorageService _storageService;

  HomePageCubit(
    this._apiService,
    this._storageService,
  ) : super(initialState: const HomePageState(status: HomePageStatus.idle));

  Future<void> getCurrentWeather() async {
    emit(state.copyWith(status: HomePageStatus.loading));

    _storageService.getLocation().match(
      () {
        emit(state.copyWith(status: HomePageStatus.redirectToSetLocation));
      },
      (location) async {
        return await makeCall(() async {
          emit(
            state.copyWith(
              status: HomePageStatus.success,
              weather: Option.of(
                await _apiService.getCurrentWeather(location),
              ),
              location: Option.of(location),
            ),
          );
        });
      },
    );
  }

  @override
  void handleError(String message) {
    emit(
      state.copyWith(
        status: HomePageStatus.error,
        errorMessage: Option.of(message),
      ),
    );
  }
}
