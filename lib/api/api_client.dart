import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/location.dart';
import 'models/weather.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('/v1/search.json')
  Future<List<Location>> searchLocation({
    @Query('key') required String key,
    @Query('q') required String query,
  });

  @GET('/v1/current.json')
  Future<Weather> getCurrentWeather({
    @Query('key') required String key,
    @Query('q') required String location,
    @Query('aqi') required String enableAirQuality,
  });
}
