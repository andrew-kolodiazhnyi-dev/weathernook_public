import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../common/services/storage_service/domain/storage_service.dart';
import '../../../../core/di/locator.dart';
import '../../../../core/l18n/strings.g.dart';
import '../../../../core/router/router.dart';
import '../../../../utils/dialogs.dart';
import '../../../app_update/app_update_service/data/firebase_app_update_service.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Widget currentWidget;

  @override
  void initState() {
    super.initState();
    final isFirstLaunch = locator<StorageService>().isFirstLaunch();
    currentWidget = isFirstLaunch ? upperTitle() : centerTitle();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (isFirstLaunch) {
        context.dialogs.showFirstLaunchDialog().then((_) {
          setState(() {
            currentWidget = centerTitle();
          });
          _navigate();
        });
      } else {
        _navigate();
      }
    });
  }

  Future<void> _navigate() async {
    await locator<FirebaseAppUpdateService>().getAndCheckAppUpdateVersions();
    Future.delayed(const Duration(milliseconds: 1100), () async {
      final location = locator<StorageService>().getLocation();
      if (location.isNone()) {
        router.replaceSearchPage();
      } else {
        router.replaceHomePage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: FadeTransition(opacity: animation, child: child),
          ),
          duration: const Duration(milliseconds: 700),
          child: currentWidget,
        ),
      ),
    );
  }

  Widget upperTitle() {
    return Builder(
      key: UniqueKey(),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Builder(builder: (context) {
                    return FaIcon(
                      FontAwesomeIcons.temperatureHalf,
                      size: MediaQuery.of(context).size.width / 4,
                      color: Theme.of(context).colorScheme.secondary,
                    );
                  }),
                  const SizedBox(width: 16),
                  Text(
                    strings.appName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget centerTitle() {
    return Builder(
      key: UniqueKey(),
      builder: (context) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.temperatureHalf,
                    size: MediaQuery.of(context).size.width / 2,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                strings.appName,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
