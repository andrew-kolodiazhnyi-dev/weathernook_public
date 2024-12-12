import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable(createToJson: false)
class Location implements Equatable {
  final int id;
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;

  Location({
    required this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
  });

  static Location fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  @override
  String toString() {
    return '$name,$region $country';
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      region,
      country,
      lat,
      lon,
    ];
  }

  @override
  bool? get stringify => true;
}
