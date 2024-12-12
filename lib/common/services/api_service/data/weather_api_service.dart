import 'package:injectable/injectable.dart';

import '../../../../api/api_client.dart';
import '../../../../api/models/current_weather.dart';
import '../../../../api/models/location.dart';
import '../../../../core/env/env.dart';
import '../../base_service.dart';
import '../../storage_service/domain/storage_service.dart';
import '../domain/api_service.dart';

@Injectable(as: ApiService)
class WeatherApiService extends BaseService implements ApiService {
  final ApiClient _apiClient;
  final StorageService _storageService;

  WeatherApiService(this._apiClient, this._storageService);

  String get apiKey => _storageService.getExternalApiKey() ?? Env.apiKey;

  @override
  Future<List<Location>> searchLocation(String query) async {
    return await makeCall(() async {
      return await _apiClient.searchLocation(
        key: apiKey,
        query: query,
      );
    });
  }

  @override
  Future<CurrentWeather> getCurrentWeather(Location location) async {
    return await makeCall(() async {
      final weather = await _apiClient.getCurrentWeather(
        key: apiKey,
        location: '${location.lat},${location.lon}',
        enableAirQuality: 'yes',
      );
      return weather.current;
    });
  }

  @override
  Future<void> tryApiKey(String apiKey) async {
    return await makeCall(() async {
      await _apiClient.getCurrentWeather(
        key: apiKey,
        location: '',
        enableAirQuality: '',
      );
    });
  }
}
