// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_update_versions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUpdateVersions _$AppUpdateVersionsFromJson(Map<String, dynamic> json) =>
    AppUpdateVersions(
      ios: Versions.fromJson(json['ios'] as Map<String, dynamic>),
      android: Versions.fromJson(json['android'] as Map<String, dynamic>),
    );

Versions _$VersionsFromJson(Map<String, dynamic> json) => Versions(
      suggested: json['suggested'] as String,
      required: json['required'] as String,
    );
