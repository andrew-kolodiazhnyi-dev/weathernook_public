import 'package:flutter/material.dart';

import 'dark_mint_blue/dark_mint_blue_theme.dart';
import 'dark_yellow/dark_yellow_theme.dart';

enum WeathernookThemeMode {
  darkYellow,
  darkMintBlue;

  ThemeData getTheme() {
    switch (this) {
      case WeathernookThemeMode.darkYellow:
        return DarkYellowTheme().themeData;
      case WeathernookThemeMode.darkMintBlue:
        return DarkMintBlue().themeData;
    }
  }
}
