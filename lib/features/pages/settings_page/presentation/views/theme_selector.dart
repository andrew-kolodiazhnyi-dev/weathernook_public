import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recase/recase.dart';

import '../../../../../common/cubit/app_control/app_control_cubit.dart';
import '../../../../../common/services/storage_service/domain/storage_service.dart';
import '../../../../../core/di/locator.dart';
import '../../../../../core/themes/weathernook_theme_mode.dart';

class ThemeSelector extends StatefulWidget {
  const ThemeSelector({super.key});

  @override
  State<ThemeSelector> createState() => _ThemeSelectorState();
}

class _ThemeSelectorState extends State<ThemeSelector> {
  late WeathernookThemeMode _theme;

  @override
  void initState() {
    super.initState();
    _theme = locator<StorageService>().getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: WeathernookThemeMode.values.map((item) {
        return RadioListTile<WeathernookThemeMode>(
          title: Text(item.name.titleCase),
          value: item,
          groupValue: _theme,
          onChanged: (WeathernookThemeMode? value) {
            if (value != null) {
              setState(() {
                _theme = value;
              });
              context.read<AppControlCubit>().setTheme(value);
            }
          },
        );
      }).toList(),
    );
  }
}