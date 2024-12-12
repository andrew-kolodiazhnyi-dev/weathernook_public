import 'package:fpdart/fpdart.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../../api/models/location.dart';
import '../../../../core/themes/weathernook_theme_mode.dart';
import '../domain/storage_service.dart';

@preResolve
@Singleton(as: StorageService)
class LocalStorageService implements StorageService {
  static const _storageBoxKey = '_storageBox';
  static const _locationKey = '_locationKey';
  static const _externalApiKey = '_externalApiKey';
  static const _isFirstLaunchKey = '_isFirstLaunch';
  static const _themeKey = '_theme';
  final Box _box;

  LocalStorageService._(this._box);

  @factoryMethod
  static Future<LocalStorageService> getInstance() async {
    final box = await Hive.openBox(_storageBoxKey);
    return LocalStorageService._(box);
  }

  @override
  @disposeMethod
  void dispose() {
    _box.close();
  }

  @override
  Future<void> setLocation(Location location) async {
    await _box.put(_locationKey, location);
  }

  @override
  Option<Location> getLocation() {
    return Option.fromNullable(_box.get(_locationKey, defaultValue: null));
  }

  @override
  Future<void> setExternalApiKey(String? key) async {
    await _box.put(_externalApiKey, key);
  }

  @override
  String? getExternalApiKey() {
    return _box.get(_externalApiKey, defaultValue: null);
  }

  @override
  bool isFirstLaunch() {
    final value = _box.get(_isFirstLaunchKey, defaultValue: true);
    if (value) {
      _box.put(_isFirstLaunchKey, false);
    }
    return value;
  }

  @override
  WeathernookThemeMode getTheme() {
    final name =
        _box.get(_themeKey, defaultValue: WeathernookThemeMode.darkYellow.name);
    return WeathernookThemeMode.values.byName(name);
  }

  @override
  Future<void> setTheme(WeathernookThemeMode theme) async {
    await _box.put(_themeKey, theme.name);
  }
}
