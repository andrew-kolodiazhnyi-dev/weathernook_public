// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) =>
    CurrentWeather(
      json['last_updated'] as String,
      (json['last_updated_epoch'] as num).toInt(),
      (json['temp_c'] as num).toDouble(),
      (json['temp_f'] as num).toDouble(),
      Condition.fromJson(json['condition'] as Map<String, dynamic>),
      (json['wind_mph'] as num).toDouble(),
      (json['wind_kph'] as num).toDouble(),
      json['wind_dir'] as String,
      (json['humidity'] as num).toInt(),
      (json['feelslike_c'] as num).toDouble(),
      (json['feelslike_f'] as num).toDouble(),
      AirQuality.fromJson(json['air_quality'] as Map<String, dynamic>),
    );
