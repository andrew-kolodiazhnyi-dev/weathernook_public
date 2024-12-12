import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app.dart';
import 'core/di/di.dart';
import 'core/env/env.dart';
import 'core/hive/hive_registrar.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapters();

  await configureDependencies();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await SentryFlutter.init(
    (options) {
      options.dsn = Env.sentryDns;
    },
    appRunner: () => runApp(
      WeathernookApp.create(),
    ),
  );
}
