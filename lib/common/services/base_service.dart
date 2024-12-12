import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../../api/api_exceptions.dart';
import '../../core/di/locator.dart';

abstract class BaseService {
  Logger get logger => locator<Logger>();

  BaseService();

  Future<T> makeCall<T>(AsyncValueGetter<T> callback) async {
    try {
      return await callback();
    } on DioException catch (exception) {
      throw await _getParsedDioException(exception);
    } catch (exception, stacktrace) {
      logger.e(exception.toString(), stackTrace: stacktrace);
      rethrow;
    }
  }

  Future<Exception> _getParsedDioException(DioException exception) async {
    try {
      await InternetAddress.lookup('google.com');
    } on SocketException {
      return NoInternetConnectionException();
    }

    try {
      final response = exception.response?.data;
      if (response == null) {
        return UnknownApiException();
      }

      return ServerException.fromJson(response).copyWith(
        statusCode: exception.response?.statusCode,
      );
    } catch (e) {
      return UnknownApiException();
    }
  }
}
