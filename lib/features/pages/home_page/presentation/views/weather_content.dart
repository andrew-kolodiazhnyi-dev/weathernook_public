import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../../api/models/current_weather.dart';
import '../../../../../core/l18n/strings.g.dart';

class WeatherContent extends StatelessWidget {
  final CurrentWeather weather;
  const WeatherContent({
    super.key,
    required this.weather,
  });

  String formatDate(String date) {
    final dateTime = DateTime.parse(weather.lastUpdated);
    final formatter = DateFormat('jm');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _WeatherTextEntity(
            left: strings.homePage.weatherContent.serverDataUpdatedOn,
            right: formatDate(weather.lastUpdated),
          ),
          _WeatherTextEntity(
            left: strings.homePage.weatherContent.currentTemp,
            right: strings.homePage.weatherContent.temperature(
              c: weather.tempC,
              f: weather.tempF,
            ),
          ),
          _WeatherTextEntity(
            left: strings.homePage.weatherContent.feelsLike,
            right: strings.homePage.weatherContent.temperature(
              c: weather.feelslikeC,
              f: weather.feelslikeF,
            ),
          ),
          const Separator(),
          _WeatherWidgetEntity(
            left: strings.homePage.weatherContent.sky,
            right: Row(
              children: [
                Image.network(
                  strings.homePage.weatherContent.httpUrlPrefix(
                    url: weather.condition.iconUrl,
                  ),
                ),
                Text(weather.condition.text),
              ],
            ),
          ),
          _WeatherTextEntity(
            left: strings.homePage.weatherContent.windDirection,
            right: '"${weather.windDir}"',
          ),
          _WeatherTextEntity(
            left: strings.homePage.weatherContent.windSpeed,
            right: strings.homePage.weatherContent.speed(
              kph: weather.windKph,
              mph: weather.windMph,
            ),
          ),
          _WeatherTextEntity(
            left: strings.homePage.weatherContent.humidity,
            right: strings.homePage.weatherContent.percentage(
              data: weather.humidity,
            ),
          ),
          const Separator(),
          _WeatherWidgetEntity(
            left: strings.homePage.weatherContent.airQuality,
            leftTextStyle: Theme.of(context).textTheme.titleMedium,
            right: const Padding(
              padding: EdgeInsets.only(left: 16),
              child: FaIcon(
                FontAwesomeIcons.wind,
                size: 16,
              ),
            ),
            mainAxisAlignment: MainAxisAlignment.start,
          ),
          _WeatherTextEntity(
            left: strings.homePage.weatherContent.carbonMonoxide,
            right: strings.homePage.weatherContent.mgM3(
              data: weather.airQuality.co,
            ),
          ),
          _WeatherTextEntity(
            left: strings.homePage.weatherContent.ozone,
            right: strings.homePage.weatherContent.mgM3(
              data: weather.airQuality.o3,
            ),
          ),
          _WeatherTextEntity(
            left: strings.homePage.weatherContent.nitrogenDioxide,
            right: strings.homePage.weatherContent.mgM3(
              data: weather.airQuality.no2,
            ),
          ),
          _WeatherTextEntity(
            left: strings.homePage.weatherContent.sulphurDioxide,
            right: strings.homePage.weatherContent.mgM3(
              data: weather.airQuality.so2,
            ),
          ),
          _WeatherTextEntity(
            left: strings.homePage.weatherContent.pm25,
            right: strings.homePage.weatherContent.mgM3(
              data: weather.airQuality.pm25,
            ),
          ),
          _WeatherTextEntity(
            left: strings.homePage.weatherContent.pm10,
            right: strings.homePage.weatherContent.mgM3(
              data: weather.airQuality.pm10,
            ),
          ),
          _WeatherTextEntity(
            left: strings.homePage.weatherContent.quality,
            right: weather.airQuality.getEpaIndexDefinition,
          ),
        ],
      ),
    );
  }
}

class _WeatherTextEntity extends StatelessWidget {
  final String left;
  final String right;

  const _WeatherTextEntity({required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(left),
          Text(right),
        ],
      ),
    );
  }
}

class _WeatherWidgetEntity extends StatelessWidget {
  final String left;
  final Widget right;
  final TextStyle? leftTextStyle;
  final MainAxisAlignment mainAxisAlignment;

  const _WeatherWidgetEntity({
    required this.left,
    required this.right,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.leftTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Text(
            left,
            style: leftTextStyle,
          ),
          right,
        ],
      ),
    );
  }
}

class Separator extends StatelessWidget {
  const Separator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 1,
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}
