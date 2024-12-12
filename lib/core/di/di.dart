import 'dart:core';

import 'package:injectable/injectable.dart';

import 'di.config.dart';
import 'locator.dart';

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async => await locator.init();
