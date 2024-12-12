import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../api/api_client.dart';
import '../../env/env.dart';

@module
abstract class ApiModule {
  @lazySingleton
  ApiClient apiClient() {
    return ApiClient(
      Dio()
        ..options.baseUrl = Env.baseUrl
        ..options.headers = {'Content-Type': 'application/json'}
        ..options.sendTimeout = const Duration(seconds: 10)
        ..options.connectTimeout = const Duration(seconds: 10)
        ..options.receiveTimeout = const Duration(seconds: 10)
        ..interceptors.add(
          LogInterceptor(
            requestBody: true,
            requestHeader: true,
            responseBody: true,
            responseHeader: true,
          ),
        ),
    );
  }
}
