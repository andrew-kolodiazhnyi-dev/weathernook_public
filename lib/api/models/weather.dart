import 'package:json_annotation/json_annotation.dart';

import 'current_weather.dart';

part 'weather.g.dart';

@JsonSerializable(createToJson: false)
class Weather {
  final CurrentWeather current;

  Weather(this.current);

  static Weather fromJson(Map<String, dynamic> json) => _$WeatherFromJson(json);
}
