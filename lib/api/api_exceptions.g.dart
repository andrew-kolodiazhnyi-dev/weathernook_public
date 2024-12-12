// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_exceptions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerException _$ServerExceptionFromJson(Map<String, dynamic> json) =>
    ServerException(
      Error.fromJson(json['error'] as Map<String, dynamic>),
      (json['statusCode'] as num?)?.toInt(),
    );

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      (json['code'] as num).toInt(),
      json['message'] as String,
    );
