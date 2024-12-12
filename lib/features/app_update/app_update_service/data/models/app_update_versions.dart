import 'package:json_annotation/json_annotation.dart';

part 'app_update_versions.g.dart';

const appUpdateFirebaseKey = 'app_update';

@JsonSerializable(createToJson: false)
class AppUpdateVersions {
  final Versions ios;
  final Versions android;

  AppUpdateVersions({required this.ios, required this.android});

  static AppUpdateVersions fromJson(Map<String, dynamic> json) =>
      _$AppUpdateVersionsFromJson(json);
}

@JsonSerializable(createToJson: false)
class Versions {
  final String suggested;
  final String required;

  Versions({required this.suggested, required this.required});

  static Versions fromJson(Map<String, dynamic> json) =>
      _$VersionsFromJson(json);
}
