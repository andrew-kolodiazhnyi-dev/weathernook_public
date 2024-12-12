import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/cubit/base_cubit.dart';
import '../../../../common/services/api_service/domain/api_service.dart';
import 'search_page_state.dart';

const minimalQueryLength = 3;

@injectable
class SearchPageCubit extends BaseCubit<SearchPageState> {
  final ApiService _apiService;

  SearchPageCubit(this._apiService)
      : super(
          initialState: const SearchPageState(
            status: SearchPageStatus.idle,
          ),
        );

  @override
  void handleError(String message) {
    emit(
      state.copyWith(
        status: SearchPageStatus.error,
        errorMessage: Option.of(message),
      ),
    );
  }

  Future<void> searchLocation(String? query) async {
    emit(state.copyWith(status: SearchPageStatus.loading));
    final currentQuery = query;
    if (currentQuery == null || currentQuery.length < minimalQueryLength) {
      emit(
        state.copyWith(
          status: SearchPageStatus.success,
          locations: const Option.none(),
        ),
      );
    } else {
      return await makeCall(
        () async {
          emit(
            state.copyWith(
              status: SearchPageStatus.success,
              locations: Option.of(
                await _apiService.searchLocation(currentQuery),
              ),
            ),
          );
        },
      );
    }
  }
}
