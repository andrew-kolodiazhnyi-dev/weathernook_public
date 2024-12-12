import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../../common/services/base_service.dart';
import '../../presentation/app_update_dialog.dart';
import '../domain/app_update_service.dart';
import 'models/app_update_versions.dart';

enum AppUpdateStatus { appUpdateRequired, appUpdateSuggested }

@singleton
class FirebaseAppUpdateService extends BaseService implements AppUpdateService {
  final PackageInfo _packageInfo;

  FirebaseAppUpdateService({required PackageInfo packageInfo})
      : _packageInfo = packageInfo;

  @override
  Future<void> getAndCheckAppUpdateVersions() {
    final data = FirebaseRemoteConfig.instance.getString(appUpdateFirebaseKey);
    final appUpdateVersions = AppUpdateVersions.fromJson(jsonDecode(data));
    final currentVersion = _packageInfo.version;
    Option<AppUpdateStatus> statusResult = const Option.none();
    if (defaultTargetPlatform == TargetPlatform.android) {
      final androidSuggested = appUpdateVersions.android.suggested;
      final androidRequired = appUpdateVersions.android.required;

      if (isArrivedVersionNewer(
          arrived: androidSuggested, current: currentVersion)) {
        statusResult = const Option.of(AppUpdateStatus.appUpdateSuggested);
      }
      if (isArrivedVersionNewer(
          arrived: androidRequired, current: currentVersion)) {
        statusResult = const Option.of(AppUpdateStatus.appUpdateRequired);
      }
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      final iosSuggested = appUpdateVersions.ios.suggested;
      final iosRequired = appUpdateVersions.ios.required;

      if (isArrivedVersionNewer(
          arrived: iosSuggested, current: currentVersion)) {
        statusResult = const Option.of(AppUpdateStatus.appUpdateSuggested);
      }
      if (isArrivedVersionNewer(
          arrived: iosRequired, current: currentVersion)) {
        statusResult = const Option.of(AppUpdateStatus.appUpdateRequired);
      }
    }
    return statusResult.match(
      () async {
        await Future.value(null);
      },
      (value) async {
        if (appUpdateDialogKey.currentContext == null) {
          await showAppUpdateDialog(value == AppUpdateStatus.appUpdateRequired);
        }
      },
    );
  }

  @protected
  @visibleForTesting
  static bool isArrivedVersionNewer({
    required String arrived,
    required String current,
  }) {
    List<int> parseToList(String str) {
      return str.trim().split('.').map((item) => int.parse(item)).toList();
    }

    final arrivedList = parseToList(arrived);
    final currentList = parseToList(current);

    if (arrivedList.length != currentList.length) return false;

    for (int i = 0; i < 3; i++) {
      if (arrivedList[i] == currentList[i]) {
        continue;
      }
      return arrivedList[i] > currentList[i];
    }
    return false;
  }
}
