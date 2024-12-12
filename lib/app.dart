import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/cubit/app_control/app_control_cubit.dart';
import 'core/di/locator.dart';
import 'core/router/app_router.dart';
import 'features/app_update/app_update_service/data/firebase_app_update_service.dart';

class WeathernookApp extends StatefulWidget {
  const WeathernookApp._();

  static Widget create() {
    return BlocProvider(
      create: (_) => locator<AppControlCubit>(),
      child: const WeathernookApp._(),
    );
  }

  @override
  State<WeathernookApp> createState() => _WeathernookAppState();
}

class _WeathernookAppState extends State<WeathernookApp>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      locator<FirebaseAppUpdateService>().getAndCheckAppUpdateVersions();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appRouter = locator<AppRouter>();
    return BlocBuilder<AppControlCubit, AppControlState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter.config(),
          theme: state.themeMode.getTheme(),
        );
      },
    );
  }
}
