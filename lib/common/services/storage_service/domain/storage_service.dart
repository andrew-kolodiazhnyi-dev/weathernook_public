import 'package:fpdart/fpdart.dart';

import '../../../../api/models/location.dart';
import '../../../../core/themes/weathernook_theme_mode.dart';

abstract interface class StorageService {
  Future<void> setLocation(Location location);

  Option<Location> getLocation();

  Future<void> setExternalApiKey(String? key);

  String? getExternalApiKey();

  bool isFirstLaunch();

  WeathernookThemeMode getTheme();

  Future<void> setTheme(WeathernookThemeMode theme);

  void dispose();
}
