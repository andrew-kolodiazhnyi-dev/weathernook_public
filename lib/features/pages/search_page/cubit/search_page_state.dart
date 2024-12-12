import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../api/models/location.dart';

enum SearchPageStatus {
  idle,
  loading,
  success,
  error,
}

class SearchPageState implements Equatable {
  final SearchPageStatus status;
  final Option<List<Location>> locations;
  final Option<String> errorMessage;

  const SearchPageState({
    required this.status,
    this.locations = const Option.none(),
    this.errorMessage = const Option.none(),
  });

  SearchPageState copyWith({
    SearchPageStatus? status,
    Option<List<Location>>? locations,
    Option<String>? errorMessage,
  }) {
    return SearchPageState(
      status: status ?? this.status,
      locations: locations ?? this.locations,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        status,
        locations,
        errorMessage,
      ];

  @override
  bool? get stringify => true;
}
