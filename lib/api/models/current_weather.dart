import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'air_quality.dart';
import 'condition.dart';

part 'current_weather.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class CurrentWeather extends Equatable {
  final String lastUpdated;
  final int lastUpdatedEpoch;
  final double tempC;
  final double tempF;
  final Condition condition;
  final double windMph;
  final double windKph;
  final String windDir;
  final int humidity;
  final double feelslikeC;
  final double feelslikeF;
  final AirQuality airQuality;

  const CurrentWeather(
    this.lastUpdated,
    this.lastUpdatedEpoch,
    this.tempC,
    this.tempF,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDir,
    this.humidity,
    this.feelslikeC,
    this.feelslikeF,
    this.airQuality,
  );

  static CurrentWeather fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);

  @override
  List<Object> get props {
    return [
      lastUpdated,
      lastUpdatedEpoch,
      tempC,
      tempF,
      condition,
      windMph,
      windKph,
      windDir,
      humidity,
      feelslikeC,
      feelslikeF,
      airQuality,
    ];
  }

  @override
  bool get stringify => true;
}
