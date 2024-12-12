import 'package:json_annotation/json_annotation.dart';

import '../core/l18n/strings.g.dart';

part 'api_exceptions.g.dart';

@JsonSerializable(createToJson: false)
class ServerException implements Exception {
  final int? statusCode;
  final Error error;

  const ServerException(this.error, [this.statusCode]);

  static ServerException fromJson(Map<String, dynamic> json) =>
      _$ServerExceptionFromJson(json);

  @override
  String toString() => '$runtimeType\n${statusCode ?? ''}\n$error';

  ServerException copyWith({
    int? statusCode,
    Error? error,
  }) {
    return ServerException(
      error ?? this.error,
      statusCode ?? this.statusCode,
    );
  }
}

@JsonSerializable(createToJson: false)
class Error {
  final int code;
  final String message;

  const Error(this.code, this.message);

  static Error fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  @override
  String toString() => 'code: $code\n message: $message';
}

class NoInternetConnectionException implements Exception {
  final String message;

  NoInternetConnectionException()
      : message = strings.exceptions.noInternetConnectionException;

  @override
  String toString() => message;
}

class UnknownApiException implements Exception {
  final String message;

  UnknownApiException() : message = strings.exceptions.unknownApiException;

  @override
  String toString() => '$runtimeType\n$message';
}
