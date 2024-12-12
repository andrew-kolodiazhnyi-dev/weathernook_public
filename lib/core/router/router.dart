import 'package:injectable/injectable.dart';

import '../di/locator.dart';
import 'app_router.dart';
import 'app_router.gr.dart';

Router get router => locator<Router>();

@singleton
class Router {
  final AppRouter appRouter;

  Router(this.appRouter);

  Future<void> maybePop() => appRouter.maybePop();
  
  bool canPop() => appRouter.canPop();

  Future<void> replaceHomePage() {
    return appRouter.pushAndPopUntil(
      const HomeRoute(),
      predicate: (route) => false,
    );
  }

  Future<void> pushSettingsPage() => appRouter.push(const SettingsRoute());

  Future<void> pushSearchPage() => appRouter.push(const SearchRoute());

  Future<void> replaceSearchPage() {
    return appRouter.replace(const SearchRoute());
  }
}
