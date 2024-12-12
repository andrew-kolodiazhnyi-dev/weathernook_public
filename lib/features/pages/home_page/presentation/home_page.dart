import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/di/locator.dart';
import '../../../../core/l18n/strings.g.dart';
import '../../../../core/router/router.dart';
import '../cubit/home_page_cubit.dart';
import '../cubit/home_page_state.dart';
import '../../../../utils/toasts.dart';
import '../../../../common/views/nook_app_bar.dart';
import 'views/weather_content.dart';

const int _refreshPeriod = 30;
const int _refreshEndTime = 0;
final int _refreshTickPeriod = 1;

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<HomePageCubit>()..getCurrentWeather(),
      child: this,
    );
  }

  void _onStateChanged(
    BuildContext context,
    HomePageState state,
  ) {
    switch (state.status) {
      case HomePageStatus.redirectToSetLocation:
        router.replaceSearchPage();
      case HomePageStatus.error:
        state.errorMessage.match(
          () {},
          (error) => context.toasts.showError(error),
        );
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NookAppBar(
        title: BlocConsumer<HomePageCubit, HomePageState>(
          listener: _onStateChanged,
          builder: (context, state) {
            return state.location.match(
              () => const SizedBox.shrink(),
              (location) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      location.region.isNotEmpty
                          ? location.region
                          : location.country,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                );
              },
            );
          },
        ),
        actions: [
          const _RefreshButton(),
        ],
      ),
      body: const SafeArea(
        child: _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Expanded(
          child: SingleChildScrollView(
            child: BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
                switch (state.status) {
                  case HomePageStatus.success:
                    return state.weather.match(
                      () => Text(strings.error.oops),
                      (weather) {
                        return WeatherContent(weather: weather);
                      },
                    );

                  default:
                    return SpinKitThreeBounce(
                      size: 24,
                      color: Theme.of(context).colorScheme.primary,
                    );
                }
              },
            ),
          ),
        )
      ],
    );
  }
}

class _RefreshButton extends StatefulWidget {
  const _RefreshButton();

  @override
  State<_RefreshButton> createState() => _RefreshButtonState();
}

class _RefreshButtonState extends State<_RefreshButton> {
  Timer? _refreshTimer;
  late int _refreshRemainingTime;
  late bool _refreshVisibility;

  @override
  void initState() {
    super.initState();
    _refreshRemainingTime = _refreshPeriod;
    _refreshVisibility = true;
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    super.dispose();
  }

  void _onTap() {
    _refreshTimer?.cancel();
    setState(() => _refreshVisibility = false);
    context.read<HomePageCubit>().getCurrentWeather();

    _refreshTimer = Timer.periodic(
      Duration(seconds: _refreshTickPeriod),
      (timer) {
        setState(() {
          if (_refreshRemainingTime != _refreshEndTime) {
            _refreshRemainingTime--;
          } else {
            _refreshVisibility = true;
            _refreshRemainingTime = _refreshPeriod;
            _refreshTimer?.cancel();
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _refreshVisibility
        ? GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _onTap,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FaIcon(
                FontAwesomeIcons.retweet,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          )
        : Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('$_refreshRemainingTime'),
          );
  }
}
