import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:injectable/injectable.dart';

import '../../../features/app_update/app_update_service/data/firebase_app_update_service.dart';
import '../../../features/app_update/app_update_service/data/models/app_update_versions.dart';
import '../../firebase/firebase_options.dart';

const _fetchTimeoutDuration = Duration(minutes: 1);
const _minimumFetchIntervalDuration = Duration(hours: 1);

@module
abstract class FirebaseModule {
  @singleton
  @preResolve
  Future<FirebaseRemoteConfig> firebaseRemoteConfig(
    FirebaseAppUpdateService appUpdateService,
  ) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: _fetchTimeoutDuration,
      minimumFetchInterval: _minimumFetchIntervalDuration,
    ));

    await remoteConfig.fetchAndActivate();

    remoteConfig.onConfigUpdated.listen((event) async {
      await remoteConfig.activate();
      if (event.updatedKeys.contains(appUpdateFirebaseKey)) {
        appUpdateService.getAndCheckAppUpdateVersions();
      }
    });
    return remoteConfig;
  }
}
