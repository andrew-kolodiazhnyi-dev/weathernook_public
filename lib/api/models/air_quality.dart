import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../core/l18n/strings.g.dart';

part 'air_quality.g.dart';

@JsonSerializable(createToJson: false)
class AirQuality extends Equatable {
  final double co;
  final double no2;
  final double o3;
  final double so2;
  @JsonKey(name: 'pm2_5')
  final double pm25;
  final double pm10;
  @JsonKey(name: 'us-epa-index')
  final int usEpaIndex;

  const AirQuality(
    this.co,
    this.no2,
    this.o3,
    this.so2,
    this.pm25,
    this.pm10,
    this.usEpaIndex,
  );

  String get getEpaIndexDefinition {
    switch (usEpaIndex) {
      case 1:
        return strings.airQualityModel.good;
      case 2:
        return strings.airQualityModel.moderate;
      case 3:
        return strings.airQualityModel.unhealthyForSensitiveGroup;
      case 4:
        return strings.airQualityModel.unhealthy;
      case 5:
        return strings.airQualityModel.veryUnhealthy;
      case 6:
        return strings.airQualityModel.hazardous;
      default:
        return strings.airQualityModel.unknown;
    }
  }

  static AirQuality fromJson(Map<String, dynamic> json) =>
      _$AirQualityFromJson(json);

  @override
  List<Object> get props {
    return [
      co,
      no2,
      o3,
      so2,
      pm25,
      pm10,
      usEpaIndex,
    ];
  }

  @override
  bool get stringify => true;
}
