import '../../../../api/models/current_weather.dart';
import '../../../../api/models/location.dart';

abstract interface class ApiService {
  Future<List<Location>> searchLocation(String query);

  Future<CurrentWeather> getCurrentWeather(Location location);

  Future<void> tryApiKey(String apiKey);
}
