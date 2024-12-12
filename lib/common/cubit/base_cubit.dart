import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import '../../api/api_exceptions.dart';
import '../../core/di/locator.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  Logger get logger => locator<Logger>();
  BaseCubit({
    required S initialState,
  }) : super(initialState);

  void handleError(String message);

  Future<void> makeCall(
    AsyncCallback callback, {
    ValueSetter<ServerException>? errorHandler,
  }) async {
    try {
      return await callback();
      //TODO: Add handling for different types of errors.
    } catch (exception, stacktrace) {
      logger.e(
        exception.toString(),
        stackTrace: stacktrace,
      );
      if (errorHandler != null && exception is ServerException) {
        errorHandler(exception);
      } else {
        handleError(exception.toString());
      }
    }
  }
}
