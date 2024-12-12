import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../api/models/current_weather.dart';
import '../../../../api/models/location.dart';

enum HomePageStatus {
  idle,
  loading,
  success,
  error,
  redirectToSetLocation,
}

class HomePageState implements Equatable {
  final HomePageStatus status;
  final Option<CurrentWeather> weather;
  final Option<String> errorMessage;
  final Option<Location> location;

  const HomePageState({
    required this.status,
    this.weather = const Option.none(),
    this.errorMessage = const Option.none(),
    this.location = const Option.none(),
  });

  HomePageState copyWith({
    HomePageStatus? status,
    Option<CurrentWeather>? weather,
    Option<String>? errorMessage,
    Option<Location>? location,
  }) {
    return HomePageState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      errorMessage: errorMessage ?? this.errorMessage,
      location: location ?? this.location,
    );
  }

  @override
  List<Object> get props => [status, weather, errorMessage, location];

  @override
  bool get stringify => true;
}
