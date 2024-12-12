// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQuality _$AirQualityFromJson(Map<String, dynamic> json) => AirQuality(
      (json['co'] as num).toDouble(),
      (json['no2'] as num).toDouble(),
      (json['o3'] as num).toDouble(),
      (json['so2'] as num).toDouble(),
      (json['pm2_5'] as num).toDouble(),
      (json['pm10'] as num).toDouble(),
      (json['us-epa-index'] as num).toInt(),
    );
