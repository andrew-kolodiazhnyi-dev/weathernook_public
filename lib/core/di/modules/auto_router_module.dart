import 'package:injectable/injectable.dart';

import '../../router/app_router.dart';

@module
abstract class AutoRouterModule {
  @singleton
  AppRouter appAutoRouter() => AppRouter();
}
